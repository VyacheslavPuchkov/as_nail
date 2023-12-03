

import UIKit

extension UILabel {
    convenience init(title: String) {
        self.init()
        text = title
        backgroundColor = UIColor(named: "pinkColor")
        textColor = .white
    }
}
