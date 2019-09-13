//
//  ImageLoader.swift
//  Navigation Example
//
//  Created by Dheeraj Bhavsar on 12/09/19.
//  Copyright © 2019 dheerajbhavsar. All rights reserved.
//

import Foundation

let cache = NSCache<NSString,NSData>()

class ImageLoader: ObservableObject {
    @Published var data = Data()
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        if let cachedData = cache.object(forKey: NSString(string: imageUrl)) {
            self.data = Data(referencing: cachedData)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    guard let data = data else { return }
                    
                    self.data = data
                    cache.setObject(NSData(data: data), forKey: NSString(string: imageUrl))
                }
            }.resume()
        }
    }
}
