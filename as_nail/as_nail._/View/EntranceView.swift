//
//  EntranceView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 22.06.2023.
//

import UIKit

class EntranceView: UIView {
    
    let entranceLabel = UILabel(title: "Авторизация")
    let emailEntrance = UITextField(placeholderText: "E-mail")
    let passwordEntrance = UITextField(placeholderText: "Пароль")
    let entranceButton = UIButton(nameButton: "Войти")
    let registrationButton = UIButton(nameButton: "Еще не с нами?")
    let bgImage = UIImageView(image: UIImage(named: "mainFoto"))
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        entranceLabel.font = UIFont.boldSystemFont(ofSize: 35)
        entranceButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        entranceButton.titleLabel?.font = .systemFont(ofSize: 25)
        registrationButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        registrationButton.titleLabel?.font = .systemFont(ofSize: 25)
        passwordEntrance.isSecureTextEntry = true
        passwordEntrance.enablePasswordToggle()
        emailEntrance.clearButtonMode = .always
        registrationButton.backgroundColor = .clear
        registrationButton.layer.borderColor = UIColor(named: "darkGrayColor")?.cgColor
        registrationButton.layer.borderWidth = 2
    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        let stack = UIStackView(views: [emailEntrance, passwordEntrance], axis: .vertical, spacing: 10)
        let stackButton = UIStackView(views: [entranceButton, registrationButton], axis: .vertical, spacing: 10)
        let stackFinal = UIStackView(views: [entranceLabel, stack, stackButton], axis: .vertical, spacing: 25)
        addSubview(stackFinal)
        stackFinal.translatesAutoresizingMaskIntoConstraints = false
        stackFinal.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            stackFinal.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackFinal.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
