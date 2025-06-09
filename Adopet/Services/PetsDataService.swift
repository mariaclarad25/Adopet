//
//  PetsDataService.swift
//  Adopet
//
//  Created by Maria Clara Dias on 06/06/25.
//

import Foundation

protocol PetsDataServiceDelegate: AnyObject {
    func didFetchPetsSuccessfully (_ pets: [Pet])
    func didFailWithError (_ error: NetwokingError)
}

class PetsDataService { 
    
    weak var delegate: PetsDataServiceDelegate?
    
    private var networkingService: NetwokingProtocol
    
    init (networkingService: NetwokingProtocol) {
        self.networkingService = networkingService
    }
    
    func fetchPets() {
        
        guard let url = URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets") else {return}
        
       // networkingService.request(url, completion: completion)
        
        networkingService.request(url) { [weak self] (result: Result<[Pet], NetwokingError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let pets):
                    self?.delegate?.didFetchPetsSuccessfully(pets)
                case .failure(let failure):
                    self?.delegate?.didFailWithError(failure)
                }
            }
        }
    }
}
