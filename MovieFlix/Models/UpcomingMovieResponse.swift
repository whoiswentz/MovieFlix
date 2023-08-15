//
//  UpcomingMovieResponse.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 15/08/23.
//

import Foundation

struct Dates: Codable {
    let maximum: String
    let minimum: String
}

struct UpcomingMovieResponse: Codable {
    let dates: Dates
    let page: Int
    let results: [Title]
}
