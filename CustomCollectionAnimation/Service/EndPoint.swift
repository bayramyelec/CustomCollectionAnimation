//
//  EndPoint.swift
//  CustomCollectionAnimation
//
//  Created by Bayram Yeleç on 29.01.2025.
//

import Foundation

protocol EndPointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    func fullURL() -> String
    func urlRequest() -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum EndPoint {
    case getProducts
}

extension EndPoint: EndPointProtocol {
    var baseURL: String {
        return "https://dummyjson.com"
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return "/products"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    func fullURL() -> String {
        return baseURL + path
    }
    
    func urlRequest() -> URLRequest {
        guard let url = URL(string: fullURL()) else { fatalError("Invalid URL") }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
