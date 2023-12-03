//
//  infoModel.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
 
struct StudioInfo {
    var infoTitle: String
    var infoContaction: String
    var url: String
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["infoTitle"] = self.infoTitle
        repres["infoContaction"] = self.infoContaction
        repres["url"] = self.url
        return repres
    }
    
    init(infoTitle: String, infoContaction: String, url: String) {
        self.infoTitle = infoTitle
        self.infoContaction = infoContaction
        self.url = url
    }
    
    init? (doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let infoTitle = data["infoTitle"] as? String else { return nil }
        guard let infoContaction = data["infoContaction"] as? String else { return nil }
        guard let url = data["url"] as? String else { return nil }
        
        self.infoTitle = infoTitle
        self.infoContaction = infoContaction
        self.url = url
    }
}

struct StudioFoto: Identifiable {
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
