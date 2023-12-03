//
//  InfoTableViewCell.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 29.06.2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    static let reuseID = "InfoTableViewCell"
    let infoTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setConstraints()
        setViews()
        backgroundColor = .clear
    }
    
    func setViews() {
        infoTitleLabel.numberOfLines = 3
        infoTitleLabel.font = UIFont.systemFont(ofSize: 17)
        infoTitleLabel.textAlignment = .left
        infoTitleLabel.textColor = .white    // UIColor(named: "grayColor")
    }
    
    func setConstraints() {
          contentView.addSubview(infoTitleLabel)
          infoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              infoTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
              infoTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
              infoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
              infoTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
              infoTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
          ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
