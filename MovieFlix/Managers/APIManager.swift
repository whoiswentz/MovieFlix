//
//  APIManager.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 23/08/23.
//

import Foundation

protocol APIManager {
    func makeRequest<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

extension APIManager {
    func makeRequest<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(T.self, from: data)
                completion(.success(results))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
}
