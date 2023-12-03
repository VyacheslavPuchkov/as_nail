//
//  myProfile.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 11.07.2023.
//

import Foundation

struct MWUser: Identifiable {
    
    var id: String
    var name: String
    var phone: Int
    var instagram: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["instagram"] = self.instagram
        
        return repres
    }
    
}
