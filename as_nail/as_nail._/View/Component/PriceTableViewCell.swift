//
//  PriceTableViewCell.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 22.06.2023.
//

import UIKit

class PriceTableViewCell: UITableViewCell {
    
    static let reuseID = "PriceTableViewCell"
    let serviseLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setConstraints()
        setViews()
        backgroundColor = .clear
    }
    
    func setViews() {
        serviseLabel.font = UIFont.systemFont(ofSize: 20)
        serviseLabel.textColor = .white
        serviseLabel.numberOfLines = 10
        serviseLabel.lineBreakMode = .byTruncatingHead
        priceLabel.font = UIFont.systemFont(ofSize: 20)
        priceLabel.textColor = .white
        priceLabel.textAlignment = .left
    }
    
    func setConstraints() {
      let stack = UIStackView(views: [serviseLabel, priceLabel], axis: .horizontal, spacing: 1)
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            priceLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
