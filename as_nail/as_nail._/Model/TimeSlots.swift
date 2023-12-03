//
//  RecordingModel.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import Foundation
import FirebaseFirestore

struct TimeSlots: Identifiable {
    var id: String
    var date: Date
    var userId: String?
    
    var dateLessCurrentDate: Bool {
        let currentDate = Date()
        return currentDate < date
    }
    
}

extension TimeSlots {
    init? (doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let date = data["date"] as? Timestamp else { return nil }
        if let userId = data["userId"] as? String { self.userId = userId }
        
        self.id = id
        self.date = date.dateValue()
    }
}

extension TimeSlots {
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["date"] = Timestamp(date: date)
        if userId != nil { repres["userId"] = self.userId }
        
        return repres
        
    }
}


