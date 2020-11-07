//
//  ObjectModelApi.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 05.11.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation
import Combine

class CategorylApi: AbstractApi {
    public static let shared = CategorylApi()
    
    func fetchCetegory(endpoint: CategoryEndpoint) -> AnyPublisher<[Category], ApiError> {
        return Future<[Category], ApiError> { [unowned self] promice in
            guard let url = endpoint.absoluteURL else {
                return promice(.failure(.urlError(URLError(.unsupportedURL))))
            }
            
            fetch(url).sink(receiveCompletion: { complection in
                handleErrors(completion: complection, promice: promice)
            }, receiveValue: { result in
                promice(.success(result))
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
