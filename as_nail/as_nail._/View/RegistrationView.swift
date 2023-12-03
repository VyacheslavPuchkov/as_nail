//
//  RegistrationView.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 21.06.2023.
//

import UIKit

class RegistrationView: UIView {
    
    let registrationLabel = UILabel(title: "Регистрация")
    let emailRegistration = UITextField(placeholderText: "Ваш email")
    let passwordRegistration = UITextField(placeholderText: "Пароль (не менее 6 символов)")
    let passwordTwoRegistration = UITextField(placeholderText: "Повторите пароль")
    let registrationButton = UIButton(nameButton: "Зарегистрироваться")
    let entranceButton = UIButton(nameButton: "Уже есть аккаунт?")
    let bgImage = UIImageView(image: UIImage(named: "mainFoto"))
    let securePassword = UIButton(nameButtonTwo: "eye")
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        registrationLabel.font = UIFont.boldSystemFont(ofSize: 35)
        registrationButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        registrationButton.titleLabel?.font = .systemFont(ofSize: 25)
        passwordRegistration.isSecureTextEntry = true
        passwordTwoRegistration.isSecureTextEntry = true
        emailRegistration.clearButtonMode = .always
        entranceButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        entranceButton.titleLabel?.font = .systemFont(ofSize: 25)
        entranceButton.backgroundColor = .clear
        entranceButton.layer.borderColor = UIColor(named: "darkGrayColor")?.cgColor
        entranceButton.layer.borderWidth = 2
        passwordRegistration.enablePasswordToggle()
        passwordTwoRegistration.enablePasswordToggle()
    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        let stack = UIStackView(views: [emailRegistration, passwordRegistration, passwordTwoRegistration], axis: .vertical, spacing: 10)
        let stackButton = UIStackView(views: [registrationButton, entranceButton], axis: .vertical, spacing: 10)
        
        let stackFinal = UIStackView(views: [registrationLabel, stack, stackButton], axis: .vertical, spacing: 25)
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
