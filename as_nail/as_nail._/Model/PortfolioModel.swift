//
//  PortfolioModel.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 08.08.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

struct Portfolio: Identifiable {
    var id: String
    var title: String
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        return repres
    }
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    init? (doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        
        self.id = id
        self.title = title
    }
}

