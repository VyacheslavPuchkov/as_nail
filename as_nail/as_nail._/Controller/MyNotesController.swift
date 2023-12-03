//
//  MyNotesViewController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit

class MyNotesController: UIViewController{
    
    var mainView = MyNotesView()
    var timeSlots: [TimeSlots] = []
    let dataFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        displayView()
        getTimeSlotUser()
    }
    
    func getTimeSlotUser() {
        guard let user = AuthService.shared.currentUser else { return }
        DatabaseService.shared.getTimeSlotUser(for: user) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let timeSlots):
                self.timeSlots = timeSlots
                self.mainView.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func displayView(){
        if let _ = AuthService.shared.currentUser {
            view = mainView
        } else {
            alertChange(titleAlert: "Необходимо авторизоваться!", messageAlert: "Для просмотра ваших записей необходимой авторизоваться!") { _ in
                let vc = EntranceControllet()
                self.navigationController?.pushViewController(vc, animated: true)
            } comletionNo: { _ in
                self.navigationController?.tabBarController?.selectedIndex = 0
            }
        }
    }
}

extension MyNotesController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeSlots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyNotesTableViewCell.reuseID , for: indexPath) as! MyNotesTableViewCell
        let timeSlot = timeSlots[indexPath.row].date
        dataFormatter.dateFormat = "dd.MM.yy HH:mm"
        let dataForm = dataFormatter.string(from: timeSlot)
        cell.myNotesLabel.text = timeSlots[indexPath.row].dateLessCurrentDate ? dataForm + " - предстоящая" : dataForm + " - прошедшая"
        cell.myNotesLabel.textColor = timeSlots[indexPath.row].dateLessCurrentDate ? .white : UIColor(named: "grayColor")
        cell.selectionStyle = .none
        return cell
    }
}



