//
//  DatabaseService.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 11.07.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage


class DatabaseService {
    
    static let shared = DatabaseService(); private init () { }
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference { db.collection("users") }
    private var reviewRef: CollectionReference { db.collection("reviews") }
    private var portfolioRef: CollectionReference { db.collection("Portfolio") }
    private var timeSlotsRef: CollectionReference { db.collection("timeSlots") }
    private var priceRef: CollectionReference { db.collection("asNailPrice") }
    private var studioFotoRef: CollectionReference { db.collection("studioFoto") }
    private var studioInfoRef: CollectionReference { db.collection("studioInfo") }
    
    
    func setProfile(user: MWUser, completion: @escaping (Result<MWUser, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(complection: @escaping (Result<MWUser, Error>) -> ()) {
        
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            guard let snap = docSnapshot else { return }
            
            guard let data = snap.data() else { return }
            
            guard let userId = data["id"] as? String else { return }
            guard let userName = data["name"] as? String else { return }
            guard let userPhone = data["phone"] as? Int else { return }
            guard let userInstagram = data["instagram"] as? String else { return }
            
            let user = MWUser(id: userId, name: userName, phone: userPhone, instagram: userInstagram)
            
            complection(.success(user))
        }
    }
    
    func setReviews(review: ReviewsUsers, completion: @escaping(Result <ReviewsUsers, Error>) -> ()) {
        
        reviewRef.document(review.id).setData(review.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(review))
            }
        }
    }
    
    func getReviews(completion: @escaping (Result<[ReviewsUsers], Error>) -> ()) {
        
        reviewRef.order(by: "date", descending: true).getDocuments { docSnapshot, error in
            if let docSnapshot = docSnapshot {
                var reviews = [ReviewsUsers]()
                for doc in docSnapshot.documents {
                    if let review = ReviewsUsers(doc: doc) {
                        reviews.append(review)
                    }
                }
                completion(.success(reviews))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getTimeSlots(beginOfDay: Date, completion: @escaping (Result<[TimeSlots], Error>) -> ()) {
        
        var components = DateComponents()
        components.day = 1
        components.second = -1
        
        guard let endOfDay = Calendar.current.date(byAdding: components, to: beginOfDay) else {
            completion(.failure(NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: "Unowned date"])))
            return
        }
        
        let predicate = NSPredicate(format: "date >= %@ AND date =< %@", argumentArray: [beginOfDay, endOfDay])
        
        timeSlotsRef.filter(using: predicate)
            .getDocuments { docSnapshot, error in
            if let docSnapshot = docSnapshot {
                var timeSlots = [TimeSlots]()
                for doc in docSnapshot.documents {
                    if let timeSlot = TimeSlots(doc: doc) {
                        if timeSlot.userId == nil {
                            timeSlots.append(timeSlot)
                        }
                    }
                }
                completion(.success(timeSlots))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getTimeSlotUser(for user: User, completion: @escaping (Result<[TimeSlots], Error>) ->()) {
       
        let predicate = NSPredicate(format: "userId == %@", user.uid)
        timeSlotsRef.filter(using: predicate)
            .getDocuments { docSnapshot, error in
                if let docSnapshot = docSnapshot {
                    var timeSlots = [TimeSlots]()
                    for doc in docSnapshot.documents{
                        if let timeSlot = TimeSlots(doc: doc) {
                            timeSlots.append(timeSlot)
                        }
                    }
                    completion(.success(timeSlots))
                } else if let error = error {
                    completion(.failure(error))
            }
        }
    }
    
    func bookingTimeSlot(timeSlot: TimeSlots, for user: User, complection: @escaping (Result<TimeSlots, Error>) -> ()) {
     
        var slot = timeSlot
        slot.userId = user.uid
        timeSlotsRef.document(timeSlot.id).setData(slot.representation) { error in
            if let error = error {
                complection(.failure(error))
            } else {
                complection(.success(timeSlot))
            }
        }
    }
    
    func getPrice(completion: @escaping(Result<[AsNailPrice], Error>) -> ()) {
      
        priceRef.getDocuments { docSnapshot, error in
            if let docSnapshot = docSnapshot {
                var prices = [AsNailPrice]()
                for doc in docSnapshot.documents {
                    if let price = AsNailPrice(doc: doc) {
                        prices.append(price)
                    }
                }
                completion(.success(prices))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getPict(completion: @escaping(Result<[Portfolio], Error >) -> ()) {
      
        portfolioRef.getDocuments { docSnapshot, error in
            if let docSnapshot = docSnapshot {
                var picts = [Portfolio]()
                for doc in docSnapshot.documents {
                    if let pict = Portfolio(doc: doc) {
                        picts.append(pict)
                    }
                }
                completion(.success(picts))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getStudioFoto(completion: @escaping(Result<[StudioFoto], Error >) -> ()) {
        
        studioFotoRef.getDocuments { docSnapshot, error in
            if let docSnapshot = docSnapshot {
                var pictsStudio = [StudioFoto]()
                for doc in docSnapshot.documents {
                    if let pictStudio = StudioFoto(doc: doc) {
                        pictsStudio.append(pictStudio)
                    }
                }
                completion(.success(pictsStudio))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getStudioInfo(completion: @escaping(Result<[StudioInfo], Error>) -> ()) {
        studioInfoRef.getDocuments { docSnapshot, error in
            if let docSnapshot = docSnapshot {
                var studioInfos = [StudioInfo]()
                for doc in docSnapshot.documents {
                    if let studioInfo = StudioInfo(doc: doc) {
                        studioInfos.append(studioInfo)
                    }
                }
                completion(.success(studioInfos))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}

