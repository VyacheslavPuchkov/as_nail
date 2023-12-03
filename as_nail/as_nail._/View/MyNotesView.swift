//
//  MyNotesView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit

class MyNotesView: UIView {

    var tableView = UITableView()
    let myNotesLabel = UILabel(title: "Мои записи")
    let bgImage = UIImageView(image: UIImage(named: "mainFotoTwo"))

    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        tableView.backgroundColor = .clear
        tableView.register(MyNotesTableViewCell.self, forCellReuseIdentifier: MyNotesTableViewCell.reuseID)
        tableView.rowHeight = 35
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        myNotesLabel.font = UIFont.boldSystemFont(ofSize: 35)
    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        addSubview(myNotesLabel)
        myNotesLabel.translatesAutoresizingMaskIntoConstraints = false
        myNotesLabel.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            myNotesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            myNotesLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: myNotesLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 5),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
