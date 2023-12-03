//
//  PriceView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 22.06.2023.
//

import UIKit

class PriceView: UIView {
    
    var tableView = UITableView()
    let priceLabel = UILabel(title: "Прайс")
    let bgImage = UIImageView(image: UIImage(named: "mainFotoTwo"))

    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        tableView.backgroundColor = .clear
        tableView.register(PriceTableViewCell.self, forCellReuseIdentifier: PriceTableViewCell.reuseID)
        tableView.rowHeight = 75
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        priceLabel.font = UIFont.boldSystemFont(ofSize: 35)
    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 5),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
