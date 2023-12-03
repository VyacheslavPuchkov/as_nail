//
//  ReviewsView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit

class ReviewsView: UIView {
    
    let bgImage = UIImageView(image: UIImage(named: "mainFoto"))
    let reviewsLabel = UILabel(title: "Отзывы")
    let tableView = UITableView()
    let reviewTextField = UITextField(placeholderTextOne: "Ваш отзыв")
    let sendButton = UIButton(nameButton: "Отправить")
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        tableView.register(ReviewsTableViewCell.self, forCellReuseIdentifier: ReviewsTableViewCell.reuseID)
        tableView.backgroundColor = .clear
        reviewsLabel.font = UIFont.boldSystemFont(ofSize: 35)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
    }
    
    func setConstaints() {
        addSubview(bgImage)
        addSubview(reviewsLabel)
        addSubview(tableView)
        addSubview(reviewTextField)
        addSubview(sendButton)
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        reviewsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            reviewsLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor, constant: 16),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: reviewTextField.topAnchor, constant: -30)
        ])
        
        reviewTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewTextField.bottomAnchor.constraint(equalTo: sendButton.topAnchor, constant: -10),
            reviewTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            sendButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
