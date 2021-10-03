//
//  NetworkManager.swift
//  ParsingJSONExcersize
//
//  Created by Arcani on 02.10.2021.
//

import Foundation

enum ErrorType: Error {
    case badURL
    case noData
    case cannotDecode
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchUsers(from url: String, completion: @escaping (Result<[User], ErrorType>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error info")
                completion(.failure(.noData))
                return }
            
            guard let dataAny = try? JSONSerialization.jsonObject(with: data) else {
                completion(.failure(.cannotDecode))
                return }
            
            guard let results = User.fetchUsers(data: dataAny) else {
                print("BAD BAD NOTHING WORKS")
                return }
            
            completion(.success(results))
        }.resume()
    }
    private init () {}
}


