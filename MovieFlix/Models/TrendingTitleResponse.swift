//
//  TrendingMovieResponse.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 14/08/23.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let page: Int
    let results: [Title]
}
