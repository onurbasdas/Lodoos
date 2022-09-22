//
//  WebService.swift
//  Lodoos
//
//  Created by Onur Başdaş on 22.09.2022.
//

import Foundation
import Alamofire

class WebService {
    static func searchMovie(movieName: String, completion: @escaping (SearchResponse?) -> ()) {
        
        let api = "\(ApiURLs.baseURL)?t=\(movieName)&apikey=\(ApiURLs.apiKey)"
        AF.request(api, method: .get, encoding: URLEncoding.default).response { response in
            guard let data = response.data else { return }
            do {
                let jsonContent = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(jsonContent)
            } catch let e {
                print(e)
                completion(nil)
            }
        }
    }
}
