//
//  ObjectModelLoader.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 31.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation
import Combine

class ObjectModelLoader: ObservableObject {
    @Published var objects = [ObjectModel]()
    @Published var error: ApiError?
    @Published var categoryId: Int64?
    
    private let pageCount = 5
    private var page: Int { Int(ceil(Float(objects.count)/Float(pageCount)))+1 }
    private var skip: Int { (page-1)*pageCount }
    private var take: Int { page * pageCount }
    
    
    init() {

        $categoryId.debounce(for: 0.1, scheduler: RunLoop.main).removeDuplicates().eraseToAnyPublisher()
            .flatMap{ [unowned self] categoryId -> AnyPublisher<[ObjectModel], ApiError> in
                
                return ObjectModelApi.shared.fetchObjectModel(endpoint: .modelList(skip: 0, take: pageCount, categoryId: categoryId))
            }
            .sink(receiveCompletion:  {[unowned self] (completion) in
                    if case let .failure(error) = completion {
                        self.error = error
                    }}
                   , receiveValue: { [unowned self] data in
                        self.objects = data
                   })
            .store(in: &subscriptions)
        
    }
    
    private func getPage(count: Int) -> Int {
        return (Int(ceil(Float(count)/Float(pageCount)))+1)
    }
    
    private func loadObjectModel(endpoint: ObjectModelEndpoint) {
        ObjectModelApi.shared.fetchObjectModel(endpoint: endpoint)
            .sink(receiveCompletion:  {[unowned self] (completion) in
                    if case let .failure(error) = completion {
                        self.error = error
                    }}
                  , receiveValue: { [unowned self] data in
                    self.objects+=data
                  })
            .store(in: &subscriptions)
    }
    
    func loadMoreObjectModels() {
        print("+++\(pageCount) - \(skip) - \(take)")
        loadObjectModel(endpoint: .modelList(skip: skip, take: take, categoryId: categoryId))
    }
    
    
    private var subscriptions = Set<AnyCancellable>()
    deinit {
        for cancell in subscriptions {
            cancell.cancel()
        }
    }
}


