

import UIKit
import FirebaseAuth

class StartView: UIView {
    
    let nameStudyLabel = UILabel(title: "AS_Nail")
    let recordButton = UIButton(nameButton: "Записаться")
    let priceButton = UIButton(nameButton: "Прайс")
    let infoButton = UIButton(nameButton: "О студии")
    let portfolioButton = UIButton(nameButton: "Портфолио")
    let bgImage = UIImageView(image: UIImage(named: "mainFoto"))
    
    init() {
        super.init(frame: .zero)
        setViews()
        setConstaints()
    }
    
    func setViews() {
        bgImage.contentMode = .scaleToFill
        recordButton.titleLabel?.font = .systemFont(ofSize: 25)
        priceButton.titleLabel?.font = .systemFont(ofSize: 25)
        infoButton.titleLabel?.font = .systemFont(ofSize: 25)
        portfolioButton.titleLabel?.font = .systemFont(ofSize: 25)
        nameStudyLabel.textColor = UIColor(named: "grayColor")
        nameStudyLabel.font = .systemFont(ofSize: 80)
    }
    
    func setConstaints() {
        addSubview(bgImage)
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        addSubview(nameStudyLabel)
        nameStudyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameStudyLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            nameStudyLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        let stackTwo = UIStackView(views: [recordButton, priceButton, infoButton, portfolioButton], axis: .vertical, spacing: 16)
        addSubview(stackTwo)
        stackTwo.translatesAutoresizingMaskIntoConstraints = false
        stackTwo.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            stackTwo.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -35),
            stackTwo.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
