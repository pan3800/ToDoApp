//
//  ImageManger.swift
//  instagramClone
//
//  Created by 임채성 on 2024/10/05.
//

import SwiftUI
import PhotosUI

struct ImageSelection {
    let image: Image
    let uiImage: UIImage
}

class ImageManager {
    
    static func convertImage(item: PhotosPickerItem?) async -> ImageSelection? {
        guard let item = item else { return nil }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return nil }
        guard let uiImage = UIImage(data: data) else { return nil }
        let image = Image(uiImage: uiImage)
        
        let imageSelection = ImageSelection(image: image, uiImage: uiImage)
        return imageSelection
    }
    
}

