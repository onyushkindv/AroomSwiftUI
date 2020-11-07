//
//  ImageLoaderCache.swift
//  Aroom SwiftUI
//
//  Created by Дмитрий Онюшкин on 02.11.2020.
//  Copyright © 2020 Дмитрий Онюшкин. All rights reserved.
//

import Foundation

class ImageLoaderCache  {
    static let shared = ImageLoaderCache()
    var loaders: NSCache<NSString, ImageLoader> = NSCache()
    
    func load(image: ImageM) -> ImageLoader {
        
        
        
        let key = NSString(string: "\(image.id)")
        
        if let loader = loaders.object(forKey: key){
            return loader
        }
        
        let loader = ImageLoader(url: URL(string: AppParam.SERVER + "/" + (image.url)))
        loaders.setObject(loader, forKey: key)
 
        return loader
    }
}
