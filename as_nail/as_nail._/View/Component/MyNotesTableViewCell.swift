//
//  TableViewCell.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 22.09.2023.
//

import UIKit

class MyNotesTableViewCell: UITableViewCell {

    static let reuseID = "MyNotesTableViewCell"
    let myNotesLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setConstraints()
        setViews()
        backgroundColor = .clear
    }
    
    func setViews() {
        myNotesLabel.numberOfLines = 1
        myNotesLabel.font = UIFont.systemFont(ofSize: 15)
        myNotesLabel.textAlignment = .left
        myNotesLabel.textColor = .white
        
    }
    
    func setConstraints() {
          contentView.addSubview(myNotesLabel)
          myNotesLabel.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              myNotesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
              myNotesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
              myNotesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
              myNotesLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
              myNotesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
          ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
