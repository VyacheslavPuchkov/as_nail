//
//  PortfolioView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 08.08.2023.
//

import UIKit

class PortfolioView: UIView {

    let bgImage = UIImageView(image: UIImage(named: "mainFoto"))
    let portfolioLabel = UILabel(title: "Портфолио")
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
        collectionView.register(PortfolioCollectionViewCell.self, forCellWithReuseIdentifier: PortfolioCollectionViewCell.reuseID)
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        portfolioLabel.font = UIFont.boldSystemFont(ofSize: 35)
    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        addSubview(portfolioLabel)
        portfolioLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            portfolioLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            portfolioLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: portfolioLabel.bottomAnchor, constant: 16),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
