//
//  HomeViewModel.swift
//  CustomCollectionAnimation
//
//  Created by Bayram Yeleç on 29.01.2025.
//

import Foundation

class HomeViewModel {
    
    var products: [Product] = [] {
        didSet {
            reloadProducts?()
        }
    }
    
    var reloadProducts: (() -> Void)?
    
    func fetchProducts() {
        NetworkManager.shared.fetchProducts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedProducts):
                    self?.products = fetchedProducts
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
