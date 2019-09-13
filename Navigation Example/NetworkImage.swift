//
//  NetworkImage.swift
//  Navigation Example
//
//  Created by Dheeraj Bhavsar on 12/09/19.
//  Copyright © 2019 dheerajbhavsar. All rights reserved.
//

import SwiftUI

struct NetworkImage: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View {
        (imageLoader.data.count == 0) ? Image("placeholder")
        .resizable()
        .scaledToFill()
        .aspectRatio(1, contentMode: .fit)
        .clipped() : Image(uiImage: UIImage(data: imageLoader.data)!)
        .resizable()
        .scaledToFill()
        .aspectRatio(1, contentMode: .fit)
        .clipped()
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(imageUrl: "https://s3.amazonaws.com/uifaces/faces/twitter/bigmancho/128.jpg")
    }
}
