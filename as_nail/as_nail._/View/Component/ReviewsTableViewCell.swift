//
//  ReviewsTableViewCell.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 30.06.2023.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {
    
    static let reuseID = "ReviewsTableViewCell"
    let infoReview = UILabel()
    let reviewUser = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setConstraints()
        setViews()
        backgroundColor = .clear
    }
    
    func setViews() {
        infoReview.font = UIFont.systemFont(ofSize: 10)
        reviewUser.font = UIFont.systemFont(ofSize: 15)
        reviewUser.textColor = .white   
        reviewUser.numberOfLines = 10
        infoReview.numberOfLines = 2
        infoReview.textColor = .white
    }
    
    func setConstraints() {
        let stack = UIStackView(views: [infoReview, reviewUser], axis: .horizontal, spacing: 10)
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stack.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        NSLayoutConstraint.activate([
            infoReview.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
