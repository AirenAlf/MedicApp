import UIKit

class LoginConstants {
    
    enum parameter {
        static let userLabel = "Correo electrónico"
        static let passwordLabel = "Contraseña"
        static let userType = "email"
        static let passwordType = "password"
    }
    enum image {
        static let toggleImageOn = UIImage(systemName: "eye")
        static let toggleImageOff = UIImage(systemName: "eye.slash")
        static let symbolUser = UIImage(named: "Sobre")
        static let imagePassword = UIImage(named: "Candado")
    }
    enum title {
        static let buttonTitle = "Saltar"
        static let firstTitle = "Bienvenido(a) \n Consultorio Medico"
    }
    enum label{
        static let labelTop = CGFloat(50)
        static let labelLeading = CGFloat(70)
    }
    enum symbol{
        static let symbolTop = CGFloat(50)
        static let symbolLeading = CGFloat(40)
        static let symbolPrivacyBotton = CGFloat(-5)
        static let symbolPrivacyTrailing = CGFloat(-60)
    }
    enum line{
        static let lineTextTop = CGFloat(5)
        static let lineTextLeading = CGFloat(70)
        static let lineTextTrailing = CGFloat(-70)
        static let lineTextHeight = CGFloat(1)
    }
    enum login {
        static let ususario = "A"
        static let password = "1"
    }
    enum alert {
        static let title = "Atención"
        static let message = "Correo y/o contraseña son incorrectas"
        static let tittleAction = "Ok"
    }
}
