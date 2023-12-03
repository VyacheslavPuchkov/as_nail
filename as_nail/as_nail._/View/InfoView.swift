//
//  InfoView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit

class InfoView: UIView {
    
    let tableView = UITableView()
    let bgImage = UIImageView(image: UIImage(named: "mainFoto"))
    let infoLabel = UILabel(title: "Информация")
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "grayColor")
        setViews()
        setConstaints()
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.reuseID)
        collectionView.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: InfoCollectionViewCell.reuseID)
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        tableView.backgroundColor = .clear
        tableView.rowHeight = 65
        infoLabel.font = UIFont.boldSystemFont(ofSize: 35)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 320)
            
        ])
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

