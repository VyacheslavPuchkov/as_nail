//
//  RecordingView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit

class RecordingView: UIView {
    
    let bgImage = UIImageView(image: UIImage(named: "mainFoto"))
    var datePicker = UIDatePicker()
    var recordingLabel = UILabel(title: "Запись")
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2 - 30, height: 38)
        layout.sectionInset = .init(top: .zero, left: 16, bottom: .zero, right: 16)
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
        collectionView.register(RecordingCollectionViewCell.self, forCellWithReuseIdentifier: RecordingCollectionViewCell.reuseID)
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        recordingLabel.font = UIFont.boldSystemFont(ofSize: 35)
        datePicker.preferredDatePickerStyle = .inline
        datePicker.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        datePicker.calendar = .current
        datePicker.datePickerMode = .date
        datePicker.tintColor = .black
        datePicker.layer.cornerRadius = 20
    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        addSubview(recordingLabel)
        recordingLabel.translatesAutoresizingMaskIntoConstraints = false
        recordingLabel.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            recordingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            recordingLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: recordingLabel.bottomAnchor, constant: 80),
            datePicker.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            datePicker.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 25),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



