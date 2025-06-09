//
//  ExternalLinksHandler.swift
//  Adopet
//
//  Created by Maria Clara Dias on 09/06/25.
//

import UIKit

class ExternalLinksHandler {
    
    private var urlHandler = URLHandler()
    
    func openTelefoneUrl (phoneNumber: String){
        if let telephoneUrl = URL(string: "tel://\(phoneNumber)") {
            urlHandler.openUrl(telephoneUrl)
        }
    }
    
    func openWhatsappUrl (phoneNumber: String, message: String) {
        guard let whatsappURL = URL(string: "whatsapp://send?phone=\(phoneNumber)&text=\(message)") else {return}
        if urlHandler.canOpenUrl(whatsappURL) {
            urlHandler.openUrl(whatsappURL)
        } else{
            openWhatsappInAppStore()
        }
        
        func openWhatsappInAppStore () {
            guard let appStoreURL = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") else {return}
            urlHandler.openUrl(appStoreURL)
        }
    }
}
