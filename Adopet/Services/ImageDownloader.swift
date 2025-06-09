//
//  ImageDownloader.swift
//  Adopet
//
//  Created by Maria Clara Dias on 06/06/25.
//

import Foundation

class ImageDownloader {
    func downloadImage(from url: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                completion(data)
            }
        }.resume()
    }
}
