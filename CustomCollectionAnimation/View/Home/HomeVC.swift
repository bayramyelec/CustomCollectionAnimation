//
//  HomeVC.swift
//  CustomCollectionAnimation
//
//  Created by Bayram Yeleç on 29.01.2025.
//

import UIKit

class HomeVC: UIViewController {
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProducts()
    }
    
    private func fetchProducts() {
        viewModel.reloadProducts = {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
        viewModel.fetchProducts()
    }

    private func updateUI() {
        viewModel.products.forEach { print($0.title) }
    }
    
}
