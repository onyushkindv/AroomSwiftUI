//
//  ContentView.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 22.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//


import SwiftUI
import Combine
import Foundation


struct Carousel: View {
    
    @GestureState var dragOffset = CGSize.zero
    
    @State private var x: CGFloat = 0
    @State private var index = 0
    
    private var data: [ImageM] = []
    private var buttonColor = "#cccccc"
    private var op:CGFloat = 0
    
    init(data: [ImageM]) {
        self.data = data
        self.op = UIScreen.main.bounds.width * CGFloat(self.data.count / 2) - (self.data.count % 2 == 0 ? ((UIScreen.main.bounds.width) / 2) : CGFloat(0))
    }
    
    init(data: [ImageM], buttonColor: String){
        self.init(data: data)
        self.buttonColor = buttonColor
    }

    var body: some View {
        VStack{
            HStack(spacing: 0) {
                Group{
                    ForEach(data, id: \.id) {image in
                        AsyncImage(loader: ImageLoaderCache.shared.load(image: image))
                            .offset(x: self.x)
                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width*0.5625)
                            .gesture(DragGesture()
                                        .updating(self.$dragOffset) { currentState, gestureState, transaction in }
                                        .onChanged({value in
                                            if value.translation.width > 0{
                                                self.x = value.location.x
                                            } else {
                                                self.x = value.location.x - UIScreen.main.bounds.width
                                            }
                                        })
                                        .onEnded { value in
                                            if value.translation.width > 50{
                                                if self.index > 0{
                                                    self.index -= 1
                                                }
                                                self.x = -(UIScreen.main.bounds.size.width * CGFloat(self.index))
                                            } else if value.translation.width < -50{
                                                if self.index < self.data.count-1{
                                                    self.index += 1
                                                }
                                                self.x = -(UIScreen.main.bounds.size.width * CGFloat(self.index))
                                            } else {
                                                self.x = -(UIScreen.main.bounds.size.width * CGFloat(self.index))
                                            }
                                        })
                    }
                }.animation(.spring()).offset(x: op)

            }.padding(.bottom, -8)
            
            HStack{
                ForEach(Array(data.enumerated()), id: \.offset) {idx, image in
                    Button(action: {}, label: {
                        if idx==self.index{
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 10, height:10)
                                .foregroundColor(Color(hex: self.buttonColor))
                        }else{
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 10, height:10)
                                .foregroundColor(Color(hex: self.buttonColor))
                        }
                    })
                }
            }
            .offset(y: -30).padding(.bottom, -30)
        }
    }
    
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
    
        
        let data: [ImageM] = [ImageM(id: 1, name: "div", url: "https://images3.alphacoders.com/106/thumb-1920-1069102.jpg"),
                           ImageM(id: 2, name: "_DSC0317", url: "https://s1.1zoom.ru/b5050/596/Evening_Forests_Mountains_Firewatch_Campo_Santo_549147_1920x1080.jpg"),
                           ImageM(id: 3, name: "div", url: "https://images3.alphacoders.com/106/thumb-1920-1069102.jpg"),
                           ImageM(id: 4, name: "_DSC0317", url: "https://wallpaper-house.com/data/out/4/wallpaper2you_33223.jpg")]
        
        Carousel(data: data)
    }
}

