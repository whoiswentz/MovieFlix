//
//  PopularMovieResponse.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 15/08/23.
//

import Foundation

struct PopularMovieResponse: Codable {
    let page: Int
    let results: [Title]
}
