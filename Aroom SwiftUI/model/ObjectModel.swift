//
//  ObjectModel.swift
//  aroom
//
//  Created by Дмитрий Онюшкин on 25.01.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation

struct ObjectModel: Codable {

    let id: Int64
    var title: String
    var subtitle: String?
    var vendorCode: String
    var price: Decimal?
    var oldPrice: Decimal?
    var preview: ImageM?
    var images: [ImageM]?
    var objectIos: ObjectForIos?
    var objectIosId: Int64
    var factory: Factory?
    var category: Category?
    var parameters: [ParameterModel]?
    var favorite: Bool
//
//    internal init(id: Int64, title: String, subtitle: String? = nil, vendorCode: String, price: Decimal? = nil, oldPrice: Decimal? = nil, preview: ImageM? = nil, images: [ImageM]? = nil, objectIos: ObjectForIos? = nil, objectIosId: Int64, factory: Factory? = nil, category: Category? = nil, parameters: [ParameterModel]? = nil, favorite: Bool) {
//           self.id = id
//           self.title = title
//           self.subtitle = subtitle
//           self.vendorCode = vendorCode
//           self.price = price
//           self.oldPrice = oldPrice
//           self.preview = preview
//           self.images = images
//           self.objectIos = objectIos
//           self.objectIosId = objectIosId
//           self.factory = factory
//           self.category = category
//           self.parameters = parameters
//           self.favorite = favorite
//       }
}
