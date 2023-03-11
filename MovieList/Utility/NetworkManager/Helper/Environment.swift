//
//  NetworkEnvironment.swift
//  CountriesList
//
//  Created by Macbook on 10/03/2022.
//

import Foundation

typealias StatusCode = Int
let kTimeoutInterval: TimeInterval = 30.0
let kNetworkEnvironment: Environment = .development
let kRequestCachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalCacheData

enum Environment: String, CaseIterable {
    case beta
    case development
    case production
}

extension Environment {
    var baseURL: String {
        switch self {
        case .beta:
            return "https://api.themoviedb.org"
        case .development:
            return "https://api.themoviedb.org"
        case .production:
            return "https://api.themoviedb.org"
        }
    }
    
    var apiKey: String {
        switch self {
        case .beta:
            return "d6caf26eee13e0701ab802bf30ed1cd9"
        case .development:
            return "d6caf26eee13e0701ab802bf30ed1cd9"
        case .production:
            return "d6caf26eee13e0701ab802bf30ed1cd9"
        }
    }
    
}
