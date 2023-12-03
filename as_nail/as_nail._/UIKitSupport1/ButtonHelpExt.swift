//
//  ButtonExt.swift
//  UIKit. Урок 2. ДЗ
//
//  Created by Вячеслав Пучков on 18.05.2023.
//

import UIKit

extension UIButton {
    convenience init(imageName: String) {
        self.init()
        backgroundColor = UIColor(named: "customBlueColor")
        setTitleColor(.black, for: .normal)
        heightAnchor.constraint(equalToConstant: 90).isActive = true
        widthAnchor.constraint(equalToConstant: 90).isActive = true
        layer.cornerRadius = 45
        setImage(UIImage(systemName: imageName), for: .normal)
        tintColor = .black
        imageView?.layer.transform = CATransform3DMakeScale(1.7, 1.7, 1.7)
        }
    }



