//
//  DetailModel.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 26.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import SwiftUI


struct DetailModelView: View {
    
        
    var objectModel: ObjectModel
    
    var buttonColor: String = "#e51717"
    let fontColor: String = "#494949"


    
    var body: some View {
            ZStack(alignment: .bottom){
                
                HStack(){
                    Button(action: {
                    
                        
                    }, label: {
                        HStack{
                            
                            Image.init(systemName: "arkit")
                                .imageScale(.medium)
                            
                            Text("Примерить")
                                .font(.system(size: 16))
                            
                        }
                        .frame(width: 130)
                        .padding(8)
                        .background(Color(hex: "#e51717"))
                        .foregroundColor(Color(hex: "#ffffff"))
                        .border(Color.black, width: 0)
                    })
                    Button(action: {}, label: {
                        HStack{
                            Image.init(systemName: "cart")
                                .imageScale(.medium)
                            Text("Купить")
                                .font(.system(size: 16))
                        }
                        .frame(width: 130)
                        .padding(8)
                        .background(Color(hex: "#e51717"))
                        .foregroundColor(Color(hex: "#ffffff"))
                        .border(Color.black, width: 0)
                    })
                }.padding(.bottom, 30).zIndex(2)
                
                ScrollView(.vertical){
                    VStack{
                        Carousel(data: objectModel.images ?? [], buttonColor: buttonColor)
                        HStack{
                            VStack(alignment: .leading){
                                Text("Супер диван 1").foregroundColor(Color(hex: fontColor)).padding(.bottom, 1)
                                Text("100500 ₽")
                                    .fontWeight(.medium)
                                    .padding(.top, 0)
                            }
                            Spacer()
                            HStack{
                                Button(action: {
                                    
                                }, label: {
                                    Image.init(systemName: "bookmark")
                                        .imageScale(.large)
                                        .padding(.horizontal, 10)
                                        .foregroundColor(Color(hex: buttonColor))
                                })
                            }
                        }.padding(.horizontal, 16).padding(.vertical, 5).padding(.bottom, 15)

                        if let params = objectModel.parameters {
                            ForEach(Array(params.enumerated()), id: \.offset){ idx, parameter in
                                HStack{
                                    Text(parameter.name)
                                    Spacer()
                                    Text(parameter.value)
                                }
                                .foregroundColor(Color(hex: fontColor))
                                .font(.system(size: 14))
                                .padding(.vertical, 5)
                                .padding(.horizontal, 16)
                                if idx != params.count-1 {
                                    Divider().padding(.horizontal, 16)
                                }
                            }
                        }
                        
                        HStack(alignment: .top){
                            ZStack {
                                AsyncImage(loader: ImageLoaderCache.shared.load(image: objectModel.factory?.preview ?? ImageM(id: 0, name: "", url: "")))
                                    .frame(width:100, height:100)
                                
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 1) {
                                Text(objectModel.factory?.name ?? "")
                                    .font(.system(size: 12))
                                    .fontWeight(.medium)
                                    .padding(.bottom, 5)
                                Text(objectModel.factory?.description ?? "")
                                    .font(.system(size: 11))
                            }
                            
                        }.padding(10).background(Color(hex: "#ebe9e9")).cornerRadius(5).padding([.top, .leading, .trailing], 16).padding(.bottom, 100)
                        
                        
                    }.frame(width: UIScreen.main.bounds.size.width, alignment: .top)
                }
                
            }.navigationBarTitle(Text(objectModel.title))
    }
}

//struct DetailModel_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailModelView()
//    }
//}
