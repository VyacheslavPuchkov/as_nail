//
//  SceneDelegate.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 07.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let scene = (scene as? UIWindowScene) else { return }
 
        window = UIWindow(windowScene: scene)
        window?.rootViewController = MainTableBaRController()
        window?.makeKeyAndVisible()
    }
}




