//
//  AbstarctApi.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 02.11.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation
import Combine

protocol AbstractApi {
}

extension AbstractApi {
    func fetch<T:Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponce = response as? HTTPURLResponse, 200...299~=httpResponce.statusCode else {
                    throw ApiError.responseError((response as? HTTPURLResponse)?.statusCode ?? 500, String(describing: String(data: data, encoding: .utf8)))
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func handleErrors<T>(completion: Subscribers.Completion<Error>, promice: (Result<T, ApiError>) -> Void) {
        if case let .failure(error) = completion {
            switch error {
            case let urlError as URLError:
                promice(.failure(.urlError(urlError)))
            case let decodingError as DecodingError:
                promice(.failure(.decodingError(decodingError)))
            case let apiError as ApiError:
                promice(.failure(apiError))
            default:
                promice(.failure(.genericError))
            }
        }
    }


}
