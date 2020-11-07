//
//  StoreData.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 27.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation
import Combine

class AppData: ObservableObject {
    @Published var modelList: [ObjectModel] = []
    
}
