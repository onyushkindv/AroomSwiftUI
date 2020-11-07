//
//  CategoryLoader.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 05.11.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation
import Combine

class CategoryLoader: ObservableObject {
    @Published var categories = [Category]()
    @Published var error: ApiError?
    @Published var current: Category? = nil
    
    func loadCategory(endpoint: CategoryEndpoint) {
        CategorylApi.shared.fetchCetegory(endpoint: endpoint)
            .sink(receiveCompletion:  {[unowned self] (completion) in
                  if case let .failure(error) = completion {
                    self.error = error
                  }}
                  , receiveValue: { [unowned self] data in
                self.categories = data
            })
            .store(in: &subscriptions)
    }
    
     
    private var subscriptions = Set<AnyCancellable>()
    deinit {
        for cancell in subscriptions {
            cancell.cancel()
        }
    }
}

