//
//  RemoteImage.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 30.08.2022.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(from URLString: String) {
        NetworkManager.shared.downloadImage(from: URLString) { UIImage in
            guard let UIImage = UIImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: UIImage)
            }
        }
    }
}

struct remoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder")
    }
}
