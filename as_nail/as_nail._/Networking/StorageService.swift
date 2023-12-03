//
//  StorageService.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 08.08.2023.
//

import Foundation
import FirebaseStorage
import UIKit

class StorageService {
    static let shared = StorageService(); private init() { }
    let storage = Storage.storage().reference()
    
    var portfolioRef: StorageReference { storage.child("Portfolio") }
    var studioFotoRef: StorageReference { storage.child("StudioFoto") }
    
    func dowloadPicture(picName: String, ref: StorageReference,  completion: @escaping([UIImage]) -> ()) {
        var image: UIImage = UIImage(named: "testFoto")!
        var images: [UIImage] = []
        let fileRef = ref.child(picName)
        fileRef.getData(maxSize: 2 * 1024 * 1024) { data, error in
            guard error == nil else {
                completion(images)
                return
            }
            image = UIImage(data: data!)!
            images.append(image)
            completion(images)
        }
    }
    
}
