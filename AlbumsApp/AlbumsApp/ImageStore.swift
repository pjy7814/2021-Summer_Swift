//
//  ImageStore.swift
//  AlbumsApp
//

import Foundation
import UIKit
import SwiftUI

class ImageStore {
    static var cache = [String : Image]()
    static func load(strUrl: String, onDownload: @escaping (Image) -> Void) -> Image {
        if let image = cache[strUrl]{
            NSLog("Using downloaded image for: \(strUrl)")
            return image
        }
        guard let url = URL(string: strUrl) else {
            print("Invalid URL:\(strUrl)")
            return Image(systemName: "tv.music.note")
        }
        NSLog("start: \(strUrl)")
        URLSession.shared.dataTask(with: url) { data, resp, err in
            var image : Image?
            if let data = data {
                if let uiImage = UIImage(data: data){
                    image = Image(uiImage: uiImage)
                }
            }
            OperationQueue.main.addOperation {
                if image != nil{
                    cache[strUrl] = image
                }
               
                NSLog("end: \(strUrl)")
                onDownload(image ?? Image(systemName: "tv.music.note"))
            }
        }.resume()
//
//        OperationQueue().addOperation {
//            guard let data = try? Data(contentsOf: url) else {
//                print("Failed to load from \(strUrl)")
//                return
//            }
//            guard let uiImage = UIImage(data: data) else {
//                print("Not an image data: \(strUrl)")
//                return
//            }
//            let image = Image(uiImage: uiImage)
//            NSLog("end: \(strUrl)")
//            onDownload(image)
//        }
        
//        guard let data = try? Data(contentsOf: url) else {
//            print("Failed to load from \(strUrl)")
//            return Image(systemName: "tv.music.note")
//        }
//
//        guard let uiImage = UIImage(data: data) else {
//            print("Not an image data: \(strUrl)")
//            return Image(systemName: "tv.music.note")
//        }
        
        
//
//        print("Image loaded: \(strUrl)")
//        return Image(uiImage: UIImage)
        return Image(systemName: "tv.music.note")
    }
}
