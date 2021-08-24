//
//  Request.swift
//  VIPER-Exemple
//
//  Created by João Luis dos Santos on 04/08/21.
//

import Foundation

enum Request {
    
    case popular
    case topRated
    case configuration
    
    private var baseUrl: String { "https://api.themoviedb.org/3/" }
    private var apiKey: String { "?api_key=1405309982146665eadb827e0dba8fdb" }
    
    private var path: String {
        switch self {
        case .popular:
            return baseUrl + "movie/popular" + apiKey
        case .topRated:
            return baseUrl + "movie/top_rated" + apiKey
        case .configuration:
            return baseUrl + "configuration" + apiKey
        }
    }
    
    private var method: String {
        switch self {
        case .popular:
            return "GET"
        case .topRated:
            return "GET"
        case .configuration:
            return "GET"
        }
    }
    
    var config: URLRequest {
        switch self {
        case .popular, .topRated:
            var request = URLRequest(url: URL(string: path)!)
            request.httpMethod = method
            return request
        case .configuration:
            var request = URLRequest(url: URL(string: path)!)
            request.httpMethod = method
            return request
        }
    }
    
}
