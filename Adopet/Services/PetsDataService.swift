//
//  PetsDataService.swift
//  Adopet
//
//  Created by Maria Clara Dias on 06/06/25.
//

import Foundation

enum NetwokingError: Error {
    case networkError(Error)
    case dataUnavailable
    case decodingError(Error)
    case urlUnavailable
}

class PetsDataService { 
    func fetchPets(url: URL, completion: @escaping (Result<[Pet], NetwokingError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (responseData, _, error) in
            if let error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = responseData else {
                completion(.failure(.dataUnavailable))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([Pet].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
