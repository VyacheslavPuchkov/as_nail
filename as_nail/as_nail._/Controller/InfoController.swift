//
//  InfoViewController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit

class InfoController: UIViewController {
    
    var mainView = InfoView()
    var mainViewTable = InfoTableViewCell()
    var studioFoto: [StudioFoto] = []
    var studioInfo: [StudioInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        getFotoStudio()
        getStudioInfo()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }

    func getFotoStudio() {
        DatabaseService.shared.getStudioFoto { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let foto):
                self.studioFoto = foto
                self.mainView.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getStudioInfo() {
        DatabaseService.shared.getStudioInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let info):
                self.studioInfo = info
                self.mainView.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension InfoController: UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: studioInfo[indexPath.row].url) else { return }
            UIApplication.shared.open(url)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studioInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.reuseID) as! InfoTableViewCell
        let infoTitle = studioInfo[indexPath.row].infoTitle
        let infoContaction = studioInfo[indexPath.row].infoContaction
        cell.infoTitleLabel.text = """
                                   \(infoTitle):
                                   \(infoContaction)
                                   """
        cell.selectionStyle = .none
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studioFoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: InfoCollectionViewCell.reuseID, for: indexPath) as? InfoCollectionViewCell)!
        cell.setFoto(title: studioFoto[indexPath.row].title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 320)
    }
}
