//
//  CatalogModelView.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 31.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import SwiftUI

struct CatalogModelView: View {
    @EnvironmentObject var objectModelLoader: ObjectModelLoader
    
    var body: some View {
        
        
        NavigationView {
            VStack(spacing: 0){
                CatogoryList(currentId: $objectModelLoader.categoryId)
                    .padding(.vertical, 15)
                if let category = objectModelLoader.categoryId {
                    Text("\(category)")
                }
                ScrollView{
                    LazyVStack{
//                        if let objects = objectModelLoader.objects {
                        ForEach(Array(objectModelLoader.objects.enumerated()), id: \.offset) {idx, object in
                                
                                NavigationLink(destination: DetailModelView(objectModel: object)){
                                    RowCatalog(objectModel: object, isLast: true).listRowInsets(EdgeInsets())
                                }
                                .buttonStyle(PlainButtonStyle())
                                .onAppear(perform: {
                                    if objectModelLoader.objects.count > 2 && idx == objectModelLoader.objects.count - 2 {
                                        objectModelLoader.loadMoreObjectModels()
                                    }
                                })
                            }
//                        }
                    }
                    
                }
                
                .alert(item: $objectModelLoader.error){ error in
                    return Alert(title: Text("NetworkError"), message: Text(error.localizedDescription), dismissButton: .default(Text("Ok")))
                }
                .navigationBarTitle(Text("Каталог"), displayMode: .inline)
                
            }
        }.onAppear(perform: {
            print("main appear")
        })
        .onDisappear(perform: {
            print("mail disappear")
        })
    }
    
}


struct CatalogModelView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogModelView().environmentObject(ObjectModelLoader())
    }
}

