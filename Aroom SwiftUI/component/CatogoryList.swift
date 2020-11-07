//
//  CatogoryList.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 03.11.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import SwiftUI

struct CatogoryList: View {
    
    @StateObject private var categoryLoader = CategoryLoader()
    @State private var current: Category? = nil
    @Binding var currentId: Int64?
    
    var body: some View {
        VStack(spacing: 10){
            if let category = current {
                HStack{
                    Text(category.name).foregroundColor(Color(hex: "#494949"))
                    Button(action: {
                        loadCategory(nil)
                    }) {
                        Image(systemName: "multiply").foregroundColor(Color(hex: "#494949"))
                    }
                    Spacer()
                }.padding(.leading, 16)
            }
            
            if categoryLoader.categories.count > 0 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(categoryLoader.categories, id: \.id) { category in

                            Button(action: {
                                loadCategory(category)
                            }) {
                                Text(category.name).padding(.horizontal, 10)
                            }
                            .padding(.vertical, 7)
                            .padding(.horizontal, 16)
                            .foregroundColor(Color(hex: "#494949"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(hex: "#494949"), lineWidth: 0.5)
                            )
                        }
                    }
                    .padding(.leading, 10)
                }
            }
        }.alert(item:  $categoryLoader.error){ error in
            return Alert(title: Text("NetworkError"), message: Text(error.localizedDescription), dismissButton: .default(Text("Ok")))
        }
        .onAppear(perform: {
            loadCategory(nil)
        }).padding(0)

    }
    
    private func loadCategory(_ parent: Category?) {
        categoryLoader.loadCategory(endpoint: .categoryList(parent: parent?.id))
        self.current = parent
        self.currentId = parent?.id
    }
    
}
//
//struct CatogoryList_Previews: PreviewProvider {
//    static var previews: some View {
//        CatogoryList()
//    }
//}
