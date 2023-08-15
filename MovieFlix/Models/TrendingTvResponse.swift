//
//  TrendingTvResponse.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 14/08/23.
//

import Foundation

struct TrendingTvResponse: Codable {
    let page: Int
    let results: [Tv]
}
