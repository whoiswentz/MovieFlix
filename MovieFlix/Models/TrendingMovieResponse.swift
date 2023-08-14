//
//  TrendingMovieResponse.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 14/08/23.
//

import Foundation

struct TrendingMovieResponse: Codable {
    let page: Int
    let results: [Movie]
}
