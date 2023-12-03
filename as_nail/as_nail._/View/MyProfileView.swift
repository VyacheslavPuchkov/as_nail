//
//  myProfileView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 11.07.2023.
//

import UIKit

class MyProfileView: UIView {
    let bgImage = UIImageView(image: UIImage(named: "mainFotoTwo"))
    let profileLabel = UILabel(title: "Профиль")
    let nameUser = UITextField(placeholderTextTwo: "Желательно с фамилией")
    let phoneUser = UITextField(placeholderTextTwo: "У вас же он есть? Так что вводите")
    let instagramUser = UITextField(placeholderTextTwo: "Он у вас есть?")
    let nameLabel = UILabel(title: "Имя:")
    let phoneLabel = UILabel(title: "Телефон:")
    let instagramLabel = UILabel(title: "Инстраграмм:")
    let exitButton = UIButton(nameButton: "Выход")
    let changeSaveButton = UIButton(nameButtonTwo: "Изменить")

    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        profileLabel.font = UIFont.boldSystemFont(ofSize: 35)
        nameLabel.font = UIFont.systemFont(ofSize: 25)
        nameUser.isEnabled = false
        phoneLabel.font = UIFont.systemFont(ofSize: 25)
        phoneUser.isEnabled = false
        instagramLabel.font = UIFont.systemFont(ofSize: 25)
        instagramUser.isEnabled = false
        phoneUser.resignFirstResponder()

    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        addSubview(profileLabel)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addSubview(changeSaveButton)
        changeSaveButton.translatesAutoresizingMaskIntoConstraints = false
        changeSaveButton.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            changeSaveButton.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 5),
            changeSaveButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -5)
        ])
        
        let stackName = UIStackView(views: [nameLabel, nameUser], axis: .vertical, spacing: 5)
        let stackPhone = UIStackView(views: [phoneLabel, phoneUser], axis: .vertical, spacing: 5)
        let stackInstagrem = UIStackView(views: [instagramLabel, instagramUser], axis: .vertical, spacing: 5)
        
        let stack = UIStackView(views: [stackName, stackPhone, stackInstagrem], axis: .vertical, spacing: 25)
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 50),
            stack.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16)
        ])

        addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            exitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

