//
//  ObjectModelApi.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 31.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation
import Combine

class ObjectModelApi: AbstractApi {
    public static let shared = ObjectModelApi()
    
    func fetchObjectModel(endpoint: ObjectModelEndpoint) -> AnyPublisher<[ObjectModel], ApiError> {
        return Future<[ObjectModel], ApiError>{ [unowned self] promice in
            guard let url = endpoint.absoluteURL else {
                return promice(.failure(.urlError(URLError(.unsupportedURL))))
            }
            
            fetch(url)
                .sink(receiveCompletion: { completion in
                    handleErrors(completion: completion, promice: promice)
                }, receiveValue: {
                    promice(.success($0))
                })
                .store(in: &self.subscriptions)
            
        }.eraseToAnyPublisher()
    }
    
    private var subscriptions = Set<AnyCancellable>()
    deinit {
        for cancell in subscriptions {
            cancell.cancel()
        }
    }
}



