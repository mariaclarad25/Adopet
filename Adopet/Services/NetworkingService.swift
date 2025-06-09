//
//  NetworkingService.swift
//  Adopet
//
//  Created by Maria Clara Dias on 09/06/25.
//

import Foundation

enum NetwokingError: Error {
    case networkError(Error)
    case dataUnavailable
    case decodingError(Error)
    case urlUnavailable
}

protocol NetwokingProtocol {
    func request <T: Decodable> (_ url: URL, completion: @escaping ((Result<T, NetwokingError>) -> Void))
}

class URLSessionNetwoking: NetwokingProtocol {
    func request<T>(_ url: URL, completion: @escaping ((Result<T, NetwokingError>) -> Void)) where T : Decodable {
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
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}

class AlamofireNetwoking: NetwokingProtocol {
    func request<T>(_ url: URL, completion: @escaping ((Result<T, NetwokingError>) -> Void)) where T : Decodable {
        print ("Requisição com alamofire")
    }
}
