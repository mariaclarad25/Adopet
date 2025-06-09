//
//  URLHandler.swift
//  Adopet
//
//  Created by Maria Clara Dias on 09/06/25.
//

import UIKit

class URLHandler {
    func openUrl (_ url: URL, 
                  options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
                  completionHandler completion: ((Bool) -> Void)? = nil) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func canOpenUrl (_ url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }
}
