//
//  PriceViewController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 22.06.2023.
//

import UIKit

class PriceController: UIViewController {
    
    var mainView = PriceView()
    var asNailPrice: [AsNailPrice] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        loadPrice()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    func loadPrice() {
        DatabaseService.shared.getPrice { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let price):
                self.asNailPrice = price
                self.mainView.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
    
    extension PriceController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return asNailPrice.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: PriceTableViewCell.reuseID) as! PriceTableViewCell
            let servise = asNailPrice[indexPath.row].services
            let priceService = asNailPrice[indexPath.row].price
            cell.serviseLabel.text = servise
            cell.priceLabel.text = priceService
            cell.selectionStyle = .none
            return cell
    }
}
