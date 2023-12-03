

import UIKit

class StartController: UIViewController {

    var mainView = StartView()
    var test: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addAction()
        
    }
    
    func addAction() {
        let actionPriceVeiw = UIAction {_ in
            let vc = PriceController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let actionRecordingView = UIAction { _ in
            if let _ = AuthService.shared.currentUser {
                let vc = RecordingController()
                self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    self.alertChange(titleAlert: "Вы не авторизованы", messageAlert: "Для онлайн записи необходимо авторизоваться!") { _ in
                        let vc = EntranceControllet()
                        self.navigationController?.pushViewController(vc, animated: true)
                    } comletionNo: { _ in
                        self.navigationController?.popViewController(animated: true)
                    }
                }
        }
        
        let actionInfoView = UIAction { _ in
            let vc = InfoController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let actionPortfolioView = UIAction {_ in
            let vc = PortfolioController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        mainView.priceButton.addAction(actionPriceVeiw, for: .touchUpInside)
        mainView.recordButton.addAction(actionRecordingView, for: .touchUpInside)
        mainView.recordButton.addAction(actionRecordingView, for: .touchUpInside)
        mainView.infoButton.addAction(actionInfoView, for: .touchUpInside)
        mainView.portfolioButton.addAction(actionPortfolioView, for: .touchUpInside)
    }

}

