//
//  Cart.swift
//  aroom
//
//  Created by Дмитрий Онюшкин on 06.06.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation

class Cart: Codable {
    let id: Int64
    let objectModel: ObjectModel
    var count: Int
}
