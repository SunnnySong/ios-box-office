//
//  MoviePosterDTO.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/16.
//

import Foundation

// MARK: - MoviePosterDTO
struct MoviePosterDTO: Codable {
    let results: [Document]
    let meta: Meta

    enum CodingKeys: String, CodingKey {
        case results = "documents"
        case meta
    }
}

// MARK: - Document
struct Document: Codable {
    let collection: Collection
    let datetime, displaySitename: String
    let docURL: String
    let height: Int
    let imageURL: String
    let thumbnailURL: String
    let width: Int

    enum CodingKeys: String, CodingKey {
        case collection, datetime
        case displaySitename = "display_sitename"
        case docURL = "doc_url"
        case height
        case imageURL = "image_url"
        case thumbnailURL = "thumbnail_url"
        case width
    }
}

enum Collection: String, Codable {
    case blog = "blog"
    case cafe = "cafe"
    case etc = "etc"
    case news = "news"
}

// MARK: - Meta
struct Meta: Codable {
    let isEnd: Bool
    let pageableCount, totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
