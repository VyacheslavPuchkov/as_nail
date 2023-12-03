//
//  MyProfileController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 11.07.2023.
//

import UIKit
import Firebase

class MyProfileController: UIViewController, ObservableObject {
    
    var mainView = MyProfileView()
    var profile: MWUser = .init(id: "", name: "", phone: 0, instagram: "")
    
    var signUp: Bool = true {
        willSet {
            if newValue {
                mainView.changeSaveButton.setTitle("Изменить", for: .normal)
            } else {
                mainView.changeSaveButton.setTitle("Сохранить", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAction()
    }
   
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        displayView()
    }
    
    func displayView(){
        if let _ = AuthService.shared.currentUser {
            view = mainView
            getProfile()
        } else {
            alertChange(titleAlert: "Необходимо авторизоваться!", messageAlert: "Для просмотра данного контента пройтите авторизацию") { _ in
                let vc = EntranceControllet()
                self.navigationController?.pushViewController(vc, animated: true)
            } comletionNo: { _ in
                self.navigationController?.tabBarController?.selectedIndex = 0
            }
        }
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print(user.name)
                self.signUp = true
            case .failure(let error):
                print("Ошибка отправки данных. \(error)")
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                self.profile = user
                self.mainView.nameUser.text = user.name
                self.mainView.phoneUser.text = String(user.phone)
                self.mainView.instagramUser.text = user.instagram
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func singOot() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        self.navigationController?.tabBarController?.selectedIndex = 0
        mainView.nameUser.text = ""
        mainView.phoneUser.text = ""
        mainView.instagramUser.text = ""
    }
    
    func addAction() {
        let actionChangeSave = UIAction {_ in
            if self.signUp == true {
                self.mainView.nameUser.isEnabled = true
                self.mainView.phoneUser.isEnabled = true
                self.mainView.instagramUser.isEnabled = true
                self.signUp = false
            } else {
                self.profile.name =  self.mainView.nameUser.text ?? ""
                self.profile.phone = Int(self.mainView.phoneUser.text ?? "") ?? 0
                self.profile.instagram = self.mainView.instagramUser.text ?? "Нет истаграмма"
                self.setProfile()
                self.mainView.nameUser.isEnabled = false
                self.mainView.phoneUser.isEnabled = false
                self.mainView.instagramUser.isEnabled = false
            }
        }
        let exitButtonTap = UIAction {_ in
            self.singOot()
        }
        mainView.changeSaveButton.addAction(actionChangeSave, for: .touchUpInside)
        mainView.exitButton.addAction(exitButtonTap, for: .touchUpInside)
    }
    
}
