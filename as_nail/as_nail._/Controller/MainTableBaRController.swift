//
//  MainTableBaRController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit
import Firebase

class MainTableBaRController: UITabBarController {
    
    var mainMenuController: UIViewController?
    var myNotesController: UIViewController?
    var reviewsController: UIViewController?
    var myProfileController: UIViewController?
    var entranceController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMenuController = StartController()
        myNotesController = MyNotesController()
        reviewsController = ReviewsController()
        myProfileController = MyProfileController()
     
       
        tabBar.tintColor = UIColor(named: "grayColor")
        tabBar.barTintColor = .white 
        tabBar.unselectedItemTintColor = .white
        
        viewControllers = [
                createNavVC(root: mainMenuController!, title: "Главная", image: UIImage(systemName: "house")!),
                createNavVC(root: reviewsController!, title: "Отзывы", image: UIImage(systemName: "menucard")!),
                createNavVC(root: myNotesController!, title: "Мои записи", image: UIImage(systemName: "list.bullet.clipboard")!),
                createNavVC(root: myProfileController!, title: "Мой профиль", image: UIImage(systemName: "person.text.rectangle")!)
            ]
    }
       
    func createNavVC(root: UIViewController,
                         title: String,
                         image: UIImage) -> UINavigationController {
            let navVC = UINavigationController(rootViewController: root)
            navVC.tabBarItem.title = title
            navVC.tabBarItem.image = image
            navVC.navigationBar.tintColor = UIColor(named: "grayColor")
            return navVC
    }
}



