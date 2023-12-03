//
//  InfoCollectionViewCell.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 09.10.2023.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "InfoCollectionViewCell"
    var studioFoto = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    func setViews() {
        studioFoto.backgroundColor = .black
    }
    
    func setConstraints() {
        contentView.addSubview(studioFoto)
        studioFoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studioFoto.topAnchor.constraint(equalTo: topAnchor),
            studioFoto.leftAnchor.constraint(equalTo: leftAnchor),
            studioFoto.rightAnchor.constraint(equalTo: rightAnchor),
            studioFoto.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setFoto(title: String) {
        StorageService.shared.dowloadPicture(picName: title, ref: StorageService.shared.studioFotoRef) { pic in
                DispatchQueue.main.async { [weak self] in
                    self?.studioFoto.image = pic.first
                }
            }
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
