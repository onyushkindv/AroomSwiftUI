//
//  ObjectForIos.swift
//  aroom
//
//  Created by Дмитрий Онюшкин on 25.01.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation

struct ObjectForIos: Codable {
    let id: Int64
    let name: String
    let version: Int32
    let extensionModel: String
    let objectFiles: [ObjectFile]?
    
    func getFileDir() -> String {
       return String(self.id) + "_" + self.name
    }
}
