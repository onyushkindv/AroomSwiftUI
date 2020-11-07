//
//  Category.swift
//  aroom
//
//  Created by Дмитрий Онюшкин on 17.03.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation

struct Category: Codable {
    let id: Int64
    let name: String
    let description: String?
    let preview: ImageM?
}
