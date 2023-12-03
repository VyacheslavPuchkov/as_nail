//
//  PriceModel.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 22.06.2023.
//

import Foundation
import FirebaseFirestore

struct AsNailPrice {
    
    var services: String
    var price: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["servises"] = self.services
        repres["price"] = self.price
        
        return repres
    }
    
    init(services: String, price: String) {
        self.services = services
        self.price = price
    }

    init? (doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let services = data["services"] as? String else { return nil }
        guard let price = data["price"] as? String else { return nil }
        
        self.services = services
        self.price = price
    }
    
 
    
}
    
