//
//  AuthService.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 06.07.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    static let shared = AuthService(); private init() { }
    
     private let auth = Auth.auth()
    
    var currentUser: User? { auth.currentUser }
    
    func createUser(email: String, password: String, completion: @escaping(Result<User, Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                let mwUser = MWUser(id: result.user.uid,
                                    name: "",
                                    phone: 0,
                                    instagram: "")
                
                DatabaseService.shared.setProfile(user: mwUser) { resultDB in
                    switch resultDB {
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signIn (email: String, password: String, completion: @escaping(Result<User, Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
