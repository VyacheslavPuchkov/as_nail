//
//  ReviewsViewController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit
import Firebase


class ReviewsController: UIViewController, ObservableObject {
    
    var mainView = ReviewsView()
    var review: ReviewsUsers = ReviewsUsers(userID: "", date: Date(), review: "")
    var reviews: [ReviewsUsers] = []
    let dataFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        addAction()
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        getReview()
        mainView.tableView.reloadData()
    }

    func setReview() {
        DatabaseService.shared.setReviews(review: review) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let review):
                print(review)
                self.mainView.tableView.reloadData()
            case .failure(let error):
                print("Ошибка отправки данных: \(error)")
            }
        }
    }
    
    func getReview() {
        DatabaseService.shared.getReviews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let reviews):
                self.reviews = reviews
                self.mainView.tableView.reloadData()
                print(self.reviews)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addAction() {
        let sendButtonAction = UIAction { _ in
            if let _ = AuthService.shared.currentUser {
                self.review.review = self.mainView.reviewTextField.text ?? ""
                self.setReview()
                self.mainView.reviewTextField.text = ""
                self.mainView.tableView.reloadData()
            } else {
                self.alertChange(titleAlert: "Вы не авторизованы", messageAlert: "Для отправки отзыва необходимо зарегистрироваться") { _ in
                    let vc = EntranceControllet()
                    self.navigationController?.pushViewController(vc, animated: true)
                } comletionNo: { _ in }
            }
        }
        mainView.sendButton.addAction(sendButtonAction, for: .touchUpInside)
    }
}

extension ReviewsController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewsTableViewCell.reuseID, for: indexPath) as! ReviewsTableViewCell
        let review = reviews[indexPath.row].review
        let date = reviews[indexPath.row].date
        dataFormatter.dateFormat = """
                                   dd.MM.yy
                                   HH:mm
                                   """
        let dateForm = dataFormatter.string(from: date)
        cell.reviewUser.text = review
        cell.infoReview.text = dateForm
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
}

