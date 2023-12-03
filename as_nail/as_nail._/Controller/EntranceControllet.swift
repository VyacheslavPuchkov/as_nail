//
//  EntranceViewControlletViewController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 22.06.2023.
//

import UIKit

class EntranceControllet: UIViewController {
    
    var mainView = EntranceView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addAction()
    }
    
    func addAction() {
        let actionEntrance = UIAction {_ in
            guard let email = self.mainView.emailEntrance.text,
                  let password = self.mainView.passwordEntrance.text else { return }
            AuthService.shared.signIn(email: email, password: password) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let user):
                    self.alertChange(titleAlert: "Успешно", messageAlert: "Вы авторизовались с email:\(user.email!)", completion: {_ in
                        self.navigationController?.popViewController(animated: true)
                    })
                case .failure(let error):
                    self.alertChange(titleAlert: "Ошибка авторизации", messageAlert: error.localizedDescription, completion: nil )}
                }
            }
        let registrationButton = UIAction {_ in
            let vc = RegistrationController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        self.mainView.entranceButton.addAction(actionEntrance, for: .touchUpInside)
        self.mainView.registrationButton.addAction(registrationButton, for: .touchUpInside)
        }
    
  
        
    }



