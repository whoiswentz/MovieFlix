//
//  YoutubeApi.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 23/08/23.
//

import Foundation

struct YoutubeConstants {
    static let API_KEY = ""
    static let baseUrl = "https://youtube.googleapis.com/youtube/v3/search"
}

enum YouttubeAPIError: Error {
    case invalidUrl
    case failedToGetData
}

class YoutubeAPI: APIManager {
    public static let shared = YoutubeAPI()
    
    public func searchMovie(with query: String, completion: @escaping (Result<YoutubeItems, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(YoutubeConstants.baseUrl)?key=\(YoutubeConstants.API_KEY)&q=\(query)") else { return }
        
        makeRequest(url: url) { (result: Result<YoutubeSearchResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.items[0]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
