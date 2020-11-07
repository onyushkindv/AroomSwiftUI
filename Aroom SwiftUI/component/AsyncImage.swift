//
//  AsincImage.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 25.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import SwiftUI
import Combine

struct AsyncImage: View {
    @StateObject var loader: ImageLoader
    
    var body: some View {
        
        if loader.image != nil{
            Image(uiImage: self.loader.image!)
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
            } else {
            Image("placeholder")
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
               
                
        }
        
        
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
