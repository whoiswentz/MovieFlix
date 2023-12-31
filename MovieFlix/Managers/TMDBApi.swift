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

class TMDBApi: APIManager {
    static let shared = TMDBApi()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        makeRequest(url: url) { (result: Result<TrendingTitleResponse, Error>) in
            switch result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(_):
                completion(.failure(APIError.failedToGetData))
            }
        }
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {
            return completion(.failure(APIError.invalidUrl))
        }
        
        makeRequest(url: url) { (result: Result<TrendingTitleResponse, Error>) in
            switch result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(_):
                completion(.failure(APIError.failedToGetData))
            }
        }
    }
    
    func getUpComingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {
            return completion(.failure(APIError.invalidUrl))
        }
        
        makeRequest(url: url) { (result: Result<UpcomingMovieResponse, Error>) in
            switch result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(_):
                completion(.failure(APIError.failedToGetData))
            }
        }
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.API_KEY)") else {
            return completion(.failure(APIError.invalidUrl))
        }
        
        makeRequest(url: url) { (result: Result<PopularMovieResponse, Error>) in
            switch result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(_):
                completion(.failure(APIError.failedToGetData))
            }
        }
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {
            return completion(.failure(APIError.invalidUrl))
        }
        
        makeRequest(url: url) { (result: Result<TopRatedResponse, Error>) in
            switch result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(_):
                completion(.failure(APIError.failedToGetData))
            }
        }
    }
    
    func getDiscoveryMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.API_KEY)&include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc") else {
            return completion(.failure(APIError.invalidUrl))
        }
        
        makeRequest(url: url) { (result: Result<TopRatedResponse, Error>) in
            switch result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(_):
                completion(.failure(APIError.failedToGetData))
            }
        }
    }
    
    func search(query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {
            return completion(.failure(APIError.invalidUrl))
        }
        
        makeRequest(url: url) { (result: Result<TopRatedResponse, Error>) in
            switch result {
            case .success(let result):
                completion(.success(result.results))
            case .failure(_):
                completion(.failure(APIError.failedToGetData))
            }
        }
    }
}
