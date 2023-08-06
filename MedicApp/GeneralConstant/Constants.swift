import UIKit

class Constants {
    
    enum color {
        static let background = UIColor(named: "ViewBackground")
        static let back = UIColor(named: "ColorBack")
        static let button = UIColor(named: "ColorButton")
    }
    enum button {
        static let titleLoginButton = "Ingresar"
        static let buttonTitle = "Saltar"
        static let cornerRadiusButton = CGFloat(5)
    }
    enum fonts {
        static let firstTitleFont = UIFont.boldSystemFont(ofSize: 20)
        static let loginButtonFont = UIFont.boldSystemFont(ofSize: 12)
    }
    enum layout {
        static let titleTop = CGFloat(50)
        static let titleLeading = CGFloat(60)
        static let titleTrailing = CGFloat(-60)
        static let buttonTop = CGFloat(50)
        static let buttonLeading = CGFloat(70)
        static let buttonTrailing = CGFloat(-70)
        static let buttonHeight = CGFloat(30)
    }

}






