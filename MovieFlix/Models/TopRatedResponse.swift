//
//  TopRatedResponse.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 15/08/23.
//

import Foundation

struct TopRatedResponse: Codable {
    let page: Int
    let results: [Title]
}
