//
//  RemoteImage.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 30.08.2022.
//

import SwiftUI

/// Loading remote image
final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(from URLString: String) {
        NetworkManager.shared.downloadImage(from: URLString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

/// Helper for presenting remote image
struct remoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable().aspectRatio(contentMode: .fill) ?? Image("food-placeholder").resizable().aspectRatio(contentMode: .fit)
    }
}

/// Remote image View
struct SmakolykRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let url: String
    
    var body: some View {
        remoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(from: url) }
    }
}
