//
//  MovieAPI.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/04.
//

import Foundation

enum MovieAPI {

    case dailyBoxOffice(String)
    case movieInformation(String)

    static var scheme: String {
        return "https"
    }

    static var host: String {
        return "kobis.or.kr"
    }

    var path: String {
        switch self {
        case .dailyBoxOffice:
            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        case .movieInformation:
            return "/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
        }
    }

    var query: [URLQueryItem] {
        var queryItem = [URLQueryItem]()
        let keyParameter = URLQueryItem(name: "key", value: Bundle.main.movieAPIKey)
        queryItem.append(keyParameter)

        switch self {
        case .dailyBoxOffice(let date):
            let dateParameter = URLQueryItem(name: "targetDt", value: date)
            queryItem.append(dateParameter)
        case .movieInformation(let movieCode):
            let movieCodeParameter = URLQueryItem(name: "movieCd", value: movieCode)
            queryItem.append(movieCodeParameter)
        }

        return queryItem
    }
}

enum DaumAPI {

    static var scheme: String {
        return "https"
    }

    static var host: String {
        return "dapi.kakao.com"
    }

    static var path: String {
        return "/v2/search/image"
    }

    static var apiKey: String {
        guard let key = Bundle.main.posterAPIKey else { return "" }
        return key
    }

    static func makeQuery(with name: String) -> [URLQueryItem] {
        let movieName = name + " 영화 포스터"
        let queryItem = URLQueryItem(name: "query", value: movieName)
        return [queryItem]
    }
}
