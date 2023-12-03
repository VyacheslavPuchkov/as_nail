//
//  RecordingCollectionViewCell.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 09.09.2023.


import UIKit

class RecordingCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "TimeSlotsCell"
    let timeSlots = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstaints()
    }
    
    func setViews() {
        timeSlots.font = UIFont.systemFont(ofSize: 25)
        timeSlots.textColor = .white
        timeSlots.textAlignment = .center
        timeSlots.layer.borderWidth = 2
        timeSlots.layer.borderColor = UIColor(named: "grayColor")?.cgColor
        timeSlots.layer.cornerRadius = 5
    }
    
    func setConstaints() {
        contentView.addSubview(timeSlots)
        timeSlots.translatesAutoresizingMaskIntoConstraints = false
        timeSlots.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            timeSlots.topAnchor.constraint(equalTo: contentView.topAnchor),
            timeSlots.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            timeSlots.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            timeSlots.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
     }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
}

