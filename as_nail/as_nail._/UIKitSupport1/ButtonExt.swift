

import UIKit

extension UIButton {
    convenience init(titleOne: String) {
        self.init()
        setTitle(titleOne, for: .normal)
        backgroundColor = UIColor(named: "pinkColor")
        setTitleColor(.white, for: .normal)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        widthAnchor.constraint(equalToConstant: 350).isActive = true
        layer.cornerRadius = 10
        
        }
}
