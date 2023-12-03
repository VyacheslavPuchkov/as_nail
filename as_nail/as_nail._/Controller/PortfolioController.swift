//
//  PortfolioController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 08.08.2023.
//

import UIKit
import Firebase
import FirebaseStorage

class PortfolioController: UIViewController {
    
    var mainView = PortfolioView()
    var portfolioPicts: [Portfolio] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        getPicts()
        self.mainView.collectionView.dataSource = self
        self.mainView.collectionView.delegate = self
    }

    func getPicts() {
        DatabaseService.shared.getPict { [weak self]  result in
            guard let self = self else { return }
            switch result {
            case .success(let picts):
                self.portfolioPicts = picts
                self.mainView.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension PortfolioController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return portfolioPicts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: PortfolioCollectionViewCell.reuseID, for: indexPath) as? PortfolioCollectionViewCell)!
        cell.setImage(title: portfolioPicts[indexPath.row].title)
        return cell
        }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 450)
    }
}



