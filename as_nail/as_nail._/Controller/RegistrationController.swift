//
//  RegistrationViewController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 21.06.2023.
//

import UIKit
import FirebaseAuth

class RegistrationController: UIViewController {
   
    var mainView = RegistrationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addAction()
    }
    
    func addAction() {
        let registrButton = UIAction { _ in
            guard let email = self.mainView.emailRegistration.text,
                  let password = self.mainView.passwordRegistration.text ,
                  let confirmPassword = self.mainView.passwordTwoRegistration.text else { return }
            guard password == confirmPassword else { return self.alertChange(titleAlert: "Ошибка при вводе пароля", messageAlert: "Ваши пароли не совпадают!", completion: nil) }
            let vc = EntranceControllet()
            AuthService.shared.createUser(email: email, password: password) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let user):
                    self.alertChange(titleAlert: "Регистрация прошла успешно", messageAlert: "Вы зарегистрировались с email:\(user.email!)", completion: {_ in
                        self.navigationController?.popViewController(animated: true)
                        self.navigationController?.pushViewController(vc, animated: true)
                    })
                case .failure(let error):
                    self.alertChange(titleAlert: "Ошибка при регистрации", messageAlert: error.localizedDescription, completion: nil )}
            }
        }
        let entranceButton = UIAction {_ in
            let vc = EntranceControllet()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        self.mainView.entranceButton.addAction(entranceButton, for: .touchUpInside)
        self.mainView.registrationButton.addAction(registrButton, for: .touchUpInside)
    }
    
 }


