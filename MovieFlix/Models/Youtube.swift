//
//  Youtube.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 23/08/23.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let kind: String
    let etag: String
    let nextPageToken: String
    let pageInfo: PageInfo
    let items: [YoutubeItems]
}

struct PageInfo: Codable {
    let totalResults: Int64
    let resultsPerPage: Int
}

struct YoutubeItems: Codable {
    let kind: String
    let etag: String
    let id: YoutubeSearchResponseId
}

struct YoutubeSearchResponseId: Codable {
    let kind: String
    let videoId: String
}
