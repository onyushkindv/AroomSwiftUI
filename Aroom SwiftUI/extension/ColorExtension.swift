//
//  ColorExtension.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 26.10.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import SwiftUI

extension Color {
    public init(hex:String) {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        if ((cString.count) == 8) {
            r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            g =  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            b = CGFloat((rgbValue & 0x0000FF)) / 255.0
            
        }else if ((cString.count) == 6){
            r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            g =  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            b = CGFloat((rgbValue & 0x0000FF)) / 255.0
        }
        
        
        self.init(red: Double(r), green: Double(g), blue: Double(b))
    }
}
