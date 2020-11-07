//
//  ObjectModelEndpoint.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 02.11.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation

enum ObjectModelEndpoint {
    
    var baseUrl: URL {URL(string: "\(AppParam.SERVER)/api/v1")!}
    
    case modelList(skip: Int, take: Int, categoryId: Int64?)
    
    func path() -> String {
        switch self {
        case .modelList(_, _, _):
            return "model/smallList"
        }
    }
    
    var absoluteURL: URL? {
            let queryURL = baseUrl.appendingPathComponent(self.path())
            let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
            guard var urlComponents = components else {
                return nil
            }
            switch self {
            case .modelList (let skip, let take, let categoryId):
                urlComponents.queryItems = [URLQueryItem(name: "token", value: AppParam.TOKEN),
                                            URLQueryItem(name: "userUuid", value: "123-123-123-123"),
                                            URLQueryItem(name: "category", value: categoryId != nil ? String(categoryId!) : ""),
                                            URLQueryItem(name: "skip", value: String(skip)),
                                            URLQueryItem(name: "take", value: String(take))]
            }
            return urlComponents.url
        }
}
