//
//  ObjectCategoryEndpoint.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 05.11.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation

enum CategoryEndpoint {
    var baseUrl: URL {URL(string: "\(AppParam.SERVER)/api/v1")!}

    case categoryList(parent: Int64?)

    func path() -> String {
        switch self {
        case .categoryList(_):
            return "category/list"
        }
    }

    var absoluteURL: URL? {
            let queryURL = baseUrl.appendingPathComponent(self.path())
            let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
            guard var urlComponents = components else {
                return nil
            }
            switch self {
            case .categoryList (let parent):
                urlComponents.queryItems = [URLQueryItem(name: "token", value: AppParam.TOKEN),
                                            URLQueryItem(name: "category", value: parent == nil ? "" : String(parent!))]
            }
            return urlComponents.url
        }
}
