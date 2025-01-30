//
//  DetailVC.swift
//  CustomCollectionAnimation
//
//  Created by Bayram Yeleç on 30.01.2025.
//

import UIKit
import SnapKit

class DetailVC: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let descTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Description"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let tagsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let warrantyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let commentsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
        
    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(brandLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(descTitle)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(tagsLabel)
        contentView.addSubview(warrantyLabel)
        contentView.addSubview(commentsLabel)
        setupConstraints()
        configure()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.right.equalTo(contentView)
            make.height.equalTo(400)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
        }
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
        }
        tagsLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(tagsLabel.snp.bottom).offset(20)
            make.left.equalTo(contentView).inset(20)
        }
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(tagsLabel.snp.bottom).offset(20)
            make.right.equalTo(contentView).inset(20)
        }
        descTitle.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(descTitle.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
        }
        warrantyLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
        }
        commentsLabel.snp.makeConstraints { make in
            make.top.equalTo(warrantyLabel.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
    }
    
    private func configure(){
        guard let product = product else { return }
        guard let productImage = product.images.first else { return }
        guard let url = URL(string: productImage) else { return }
        imageView.kf.setImage(with: url)
        titleLabel.text = product.title
        priceLabel.text = "$\(product.price)"
        ratingLabel.text = "★ \(product.rating)"
        descriptionLabel.text = product.description
        tagsLabel.text = "tags: \(product.tags.joined(separator: ", "))"
        brandLabel.text = product.brand
        warrantyLabel.text = product.warrantyInformation
        commentsLabel.text = "Comments: \n\(product.reviews.map { $0.comment }.joined(separator: "\n"))"
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(leftButtonTapped))
    }
    
    @objc func leftButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
