//
//  SingleImage.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 08.11.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import SwiftUI

struct SingleImage: View {
    
    var image: ImageM
        
    
    var body: some View {
        ForEach([image], id: \.id) {img in
                    AsyncImage(loader: ImageLoaderCache.shared.load(image: img))
                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width*0.5625)
        }
    }
}

//struct SingleImage_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleImage(image: [ImageM(id: 1, name: "div", url: "https://images3.alphacoders.com/106/thumb-1920-1069102.jpg")])
//
//    }
//}
