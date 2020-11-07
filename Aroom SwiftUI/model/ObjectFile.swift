//
//  ObjectFile.swift
//  aroom
//
//  Created by Дмитрий Онюшкин on 30.01.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation

struct ObjectFile: Codable {
    let id: Int64
    let url: String
    let type: ObjectFileType
}
