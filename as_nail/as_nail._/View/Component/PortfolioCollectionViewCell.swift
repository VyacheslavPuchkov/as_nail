//
//  PortfolioCollectionViewCell.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.09.2023.
//

import UIKit

class PortfolioCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "PortfolioCell"
    var portfolioFoto = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    func setViews() {
        portfolioFoto.backgroundColor = .black
    }
    
    func setConstraints() {
        contentView.addSubview(portfolioFoto)
        portfolioFoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            portfolioFoto.topAnchor.constraint(equalTo: topAnchor),
            portfolioFoto.leftAnchor.constraint(equalTo: leftAnchor),
            portfolioFoto.rightAnchor.constraint(equalTo: rightAnchor),
            portfolioFoto.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setImage(title: String) {
        StorageService.shared.dowloadPicture(picName: title, ref: StorageService.shared.portfolioRef) { pic in
                DispatchQueue.main.async { [weak self] in
                    self?.portfolioFoto.image = pic.first
                }
            }
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
