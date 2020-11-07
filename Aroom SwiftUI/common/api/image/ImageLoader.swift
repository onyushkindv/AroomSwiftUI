//
//  ImageLoader.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 25.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

class ImageLoader: ObservableObject{
    @Published var image: UIImage?
    @Published var url: URL?
    
    init(url: URL?) {
        self.url = url
        
        
        
        $url.flatMap{ path -> AnyPublisher<UIImage?, Never> in
            return self.fetch(url: url)
        }
        .assign(to: \.image, on: self)
        .store(in: &subscriptions)
    }

    
    func fetch(url: URL?) -> AnyPublisher<UIImage?, Never> {
        guard self.image == nil else {
            return Just(nil).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map { UIImage(data: $0.data)! }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    

    
    private var subscriptions = Set<AnyCancellable>()
    deinit {
        for cancell in subscriptions {
            cancell.cancel()
        }
    }
}


