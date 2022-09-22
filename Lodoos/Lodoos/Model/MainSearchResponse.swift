//
//  MainSearchResponse.swift
//  Lodoos
//
//  Created by Onur Başdaş on 22.09.2022.
//

import Foundation

// MARK: - Welcome
struct MainSearchResponse: Codable {
    var search: [MainSearchResponseSearch]?
    var totalResults, response: String?
}

// MARK: - Search
struct MainSearchResponseSearch: Codable {
    var title, year, imdbID: String?
    var type: MainSearchResponseTypeEnum?
    var poster: String?
}

enum MainSearchResponseTypeEnum: Codable {
    case movie
    case series
}
