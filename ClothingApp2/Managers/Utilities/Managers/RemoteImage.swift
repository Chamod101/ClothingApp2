//
//  RemoteImage.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-21.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) {uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
    
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View{
        image?.resizable() ?? Image("PlaceHolder").resizable()
    }
    
}

struct ProductRemoteImage: View{
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear {imageLoader.load(fromURLString: urlString)}
    }
}
