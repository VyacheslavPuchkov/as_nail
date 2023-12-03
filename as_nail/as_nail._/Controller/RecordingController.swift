//
//  RecordingViewController.swift
//  as_nail._
//
//  Created by Вячеслав Пучков on 24.06.2023.
//

import UIKit
import FirebaseAuth

class RecordingController: UIViewController {
    
    var mainView = RecordingView()
    var selectedDate: Date = Date()
    var timeSlots: [TimeSlots] = []
    let dataFormatter = DateFormatter()

    
    var beginOfDay: Date {
        let calendar = Calendar.current
        let date = calendar.startOfDay(for: selectedDate)
        return date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        getTimeSlots()
        nextMonth()
        mainView.datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        self.mainView.collectionView.dataSource = self
        self.mainView.collectionView.delegate = self
    }
    
    func getTimeSlots() {
        DatabaseService.shared.getTimeSlots(beginOfDay: beginOfDay) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let timeSlots):
                self.timeSlots = timeSlots
                self.mainView.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
   }
    func bookTimeSlot(_ timeSlot: TimeSlots) {
        guard let user = AuthService.shared.currentUser else { return }
        DatabaseService.shared.bookingTimeSlot(timeSlot: timeSlot, for: user) { [weak self] result in
            guard let self = self  else { return }
            switch result {
            case .success(_):
                self.getTimeSlots()
            case .failure(let error):
                print(error)
            }
        }
    }
    func nextMonth() {
        let minDay = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        let maxDay = Calendar.current.date(byAdding: .month, value: 1, to: selectedDate.endOfMonth())
        mainView.datePicker.minimumDate = minDay
        mainView.datePicker.maximumDate = maxDay
    }
    
    @objc func dateChanged(picker: UIDatePicker) {
        selectedDate = picker.date
        getTimeSlots()
    }
    
}

extension RecordingController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeSlots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordingCollectionViewCell.reuseID, for: indexPath) as? RecordingCollectionViewCell {
            let timeSlot = timeSlots[indexPath.row].date
            dataFormatter.dateFormat = "HH:mm"
            let dateForm = dataFormatter.string(from: timeSlot)
            cell.timeSlots.text = dateForm
            return cell
        }
        return UICollectionViewCell()
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTimeSlot = timeSlots[indexPath.row]
        alertChange(titleAlertTwo: "Вы выбрали дату!", messageAlert: "Уверены что хотите записаться на \(selectedTimeSlot.date)") { _ in
            self.bookTimeSlot(selectedTimeSlot)
        } comletionNo: { _ in
        }
    }
}


