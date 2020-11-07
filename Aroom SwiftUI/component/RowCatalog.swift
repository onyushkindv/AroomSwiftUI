//
//  RowCatalog.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 31.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import SwiftUI
import Combine

struct RowCatalog: View {
    
    var objectModel: ObjectModel
    var isLast: Bool?
    
    var buttonColor: String = "#e51717"
    let fontColor: String = "#494949"
    
    
//    init(objectModel: ObjectModel, isLast: Bool) {
//        self.objectModel = objectModel
//        self.isLast = isLast
//    }
    
    var body: some View {
        VStack{
//            AsyncImage(loader: ImageLoaderCache.shared.load(image: objectModel!.preview!))
//                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width*0.5625)
            Carousel(data: objectModel.images ?? [], buttonColor: buttonColor)
                
            HStack{
                VStack(alignment: .leading){
                    Text(objectModel.title).foregroundColor(Color(hex: fontColor)).padding(.bottom, 1)
                    Text("100500 ₽")
                        .fontWeight(.medium)
                        .padding(.top, 0)
                }
                Spacer()
                HStack{
                            Button(action: {

                            }, label: {
                                Image.init(systemName: "cart")
                                    .imageScale(.large)
                                    .padding(.trailing, 5)
                                    .foregroundColor(Color(hex: buttonColor))
                            })
                    
                    Button(action: {
                        
                    }, label: {
                        Image.init(systemName: "bookmark")
                            .imageScale(.large)
                            .padding(.horizontal, 10)
                            .foregroundColor(Color(hex: buttonColor))
                    })
                }
            }.padding(.horizontal, 16).padding(.vertical, 5).padding(.bottom, 15)
        }
    }
}

//struct RowCatalog_Previews: PreviewProvider {
//    static var previews: some View {
//        RowCatalog(objectModel: ObjectModel(id: 1, title:  "new Elrment", subtitle: nil, vendorCode: "123gf45", price: 12200, oldPrice: nil, preview: ImageM(id: 1, name: "div", url: "https://images3.alphacoders.com/106/thumb-1920-1069102.jpg"), images: nil, objectIos: nil, objectIosId: 1, factory: nil, category: nil, parameters: nil, favorite: true), isLast: false)
//    }
//}
