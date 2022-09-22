//
//  SearchResponse.swift
//  Lodoos
//
//  Created by Onur Başdaş on 22.09.2022.
//

import Foundation


/// Search Response Model
struct SearchResponse: Codable {
    var title: String?
    var year: String?
    var rated: String?
    var released: String?
    var runTime: String?
    var genre: String?
    var director: String?
    var writer: String?
    var actors: String?
    var plot: String?
    var language: String?
    var country: String?
    var awards: String?
    var poster: String?
    var ratings: [SearchRatingsModel]?
    var metaScore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var type: String?
    var dvd: String?
    var boxOffice: String?
    var production: String?
    var webSite: String?
    var response: String?
    
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metaScore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case webSite = "Website"
        case response = "Response"
    }
}

struct SearchRatingsModel: Codable {
    var source: String?
    var value: String?
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
