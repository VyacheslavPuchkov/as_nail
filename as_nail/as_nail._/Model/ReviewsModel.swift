//
//  ReviewsModel.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import Foundation
import FirebaseFirestore

struct ReviewsUsers: Identifiable {
    
    var id: String = UUID().uuidString
    var userID: String
    var date: Date
    var review: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["userID"] = self.userID
        repres["date"] = Timestamp(date: date)
        repres["review"] = self.review
        
        return repres
        
    }
    
    init (userID: String, date: Date, review: String) {
        self.userID = userID
        self.date = Date()
        self.review = review
    }
    
    init? (doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let userID = data["userID"] as? String else { return nil }
        guard let date = data["date"] as? Timestamp else { return nil }
        guard let review = data["review"] as? String else { return nil }
        
        self.id = id
        self.userID = userID
        self.date = date.dateValue()
        self.review = review
    }
    
}
