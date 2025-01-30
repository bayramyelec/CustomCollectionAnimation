//
//  HomeVC.swift
//  CustomCollectionAnimation
//
//  Created by Bayram Yeleç on 29.01.2025.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    var viewModel = HomeViewModel()
    
    internal var isSingleColumn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProducts()
        setupNavigationBar()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Products"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.grid.2x2"), style: .plain, target: self, action: #selector(rightButtonTapped))
    }
    
    @objc func rightButtonTapped() {
        isSingleColumn.toggle()
        navigationItem.rightBarButtonItem?.image = isSingleColumn ? UIImage(systemName: "rectangle.grid.2x2") : UIImage(systemName: "rectangle.grid.1x2")
        
        let newLayout = UICollectionViewFlowLayout()
        newLayout.scrollDirection = .vertical
        newLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView.setCollectionViewLayout(newLayout, animated: true)
        collectionView.reloadData()
        
    }
    
    private func fetchProducts() {
        viewModel.reloadProducts = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        viewModel.fetchProducts()
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let item = viewModel.products[indexPath.item]
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = isSingleColumn ? screenWidth / 1.1 : screenWidth / 2.2
        return CGSize(width: width, height: screenWidth / 1.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.product = viewModel.products[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}
