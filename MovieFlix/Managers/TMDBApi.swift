//
//  TMDBApi.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 13/08/23.
//

import Foundation

struct Constants {
    static let API_KEY = ""
    static let baseUrl = "https://api.themoviedb.org"
}

enum APIError: Error {
    case invalidUrl
    case failedToGetData
}

class TMDBApi {
    static let shared = TMDBApi()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs() async  -> Result<[Tv], Error> {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {
            return .failure(APIError.invalidUrl)
        }
        
        return await withCheckedContinuation { continuation in
            makeRequest(url: url) { (result: Result<TrendingTvResponse, Error>) in
                switch result {
                case .success(let result):
                    continuation.resume(returning: .success(result.results))
                case .failure(let error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
    
    private func makeRequest<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(T.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
