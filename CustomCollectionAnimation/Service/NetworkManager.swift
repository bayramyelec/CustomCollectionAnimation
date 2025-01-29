//
//  NetworkManager.swift
//  CustomCollectionAnimation
//
//  Created by Bayram Yeleç on 29.01.2025.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private func fetchData<T: Decodable>(_ endpoint: EndPoint, completion: @escaping (Result<T, Error>) -> Void){
        let task = URLSession.shared.dataTask(with: endpoint.urlRequest()) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard response is HTTPURLResponse else {
                completion(.failure(error?.localizedDescription as Any as! Error))
                return
            }
            guard let data = data else {
                completion(.failure(error?.localizedDescription as Any as! Error))
                return
            }
            do {
                let item = try JSONDecoder().decode(T.self, from: data)
                completion(.success(item))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let endPoint = EndPoint.getProducts
        fetchData(endPoint) { (result: Result<Products, Error>) in
            switch result {
            case .success(let success):
                completion(.success(success.products))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
}
