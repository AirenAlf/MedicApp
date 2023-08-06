import UIKit


class LoginViewController: UIViewController {
    
    private var skipButton = UIButton(type: .system)
    private var titleText = UILabel()
    private var usuarioLabel = UITextField()
    private var passwordLabel = UITextField()
    private var lineText = UIView()
    private var lineTextTwo = UIView()
    private var symbolUser = UIImageView()
    private var symbolPassword = UIImageView()
    private var imagenPrivate = UIImageView()
    private var loginButton = UIButton()
    private let symbolPrivacy = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = UIColor(named: "ViewBackground")
        configureSkipButton()
        configureTitleText()
        configureLabel(texto: usuarioLabel, placeholder: LoginConstants.parameter.userLabel, type: LoginConstants.parameter.userType)
        configureLabel(texto: passwordLabel, placeholder: LoginConstants.parameter.passwordLabel, type: LoginConstants.parameter.passwordType)
        configureLineText()
        configureLineTextTwo()
        configureImagenUsuario()
        configureImagenPassword()
        configureToggleButton()
        configureLoginButton()
        configureLayout()
    }
    func configureToggleButton(){
        symbolPrivacy.translatesAutoresizingMaskIntoConstraints = false
        symbolPrivacy.setImage(LoginConstants.image.toggleImageOff, for: .normal)
        symbolPrivacy.tintColor = .lightGray
        symbolPrivacy.addTarget(self, action: #selector(PasswordVisibility), for: .touchDown)
        symbolPrivacy.addTarget(self, action: #selector(PasswordNoVisibility), for: .touchUpInside)
            view.addSubview(symbolPrivacy)
        }
        @objc func PasswordVisibility() {
            passwordLabel.isSecureTextEntry = false
            let buttonImage = LoginConstants.image.toggleImageOn
            symbolPrivacy.setImage(buttonImage, for: .normal)
        }
    @objc func PasswordNoVisibility() {
        passwordLabel.isSecureTextEntry = true
        let buttonImage = LoginConstants.image.toggleImageOff
        symbolPrivacy.setImage(buttonImage, for: .normal)
    }
    func configureSkipButton(){
        skipButton.setTitle(Constants.button.buttonTitle, for: .normal)
        skipButton.setTitleColor(.black, for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: skipButton)
    }
    func configureTitleText(){
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.text = LoginConstants.title.firstTitle
        titleText.font = Constants.fonts.firstTitleFont
        titleText.numberOfLines = 0
        titleText.textAlignment = .center
        view.addSubview(titleText)
    }
    func configureLineText(){
        lineText.translatesAutoresizingMaskIntoConstraints = false
        lineText.backgroundColor = UIColor.gray
        view.addSubview(lineText)
    }
    func configureLineTextTwo(){
        lineTextTwo.translatesAutoresizingMaskIntoConstraints = false
        lineTextTwo.backgroundColor = UIColor.gray
        view.addSubview(lineTextTwo)
    }
    func configureImagenUsuario(){
        symbolUser.translatesAutoresizingMaskIntoConstraints = false
        symbolUser.image = LoginConstants.image.symbolUser
        view.addSubview(symbolUser)
    }
    func configureImagenPassword(){
        symbolPassword.translatesAutoresizingMaskIntoConstraints = false
        symbolPassword.image = LoginConstants.image.imagePassword
        view.addSubview(symbolPassword)
    }
    func configureLabel(texto : UITextField, placeholder: String, type: String){
        texto.translatesAutoresizingMaskIntoConstraints = false
        texto.placeholder = placeholder
        texto.font = Constants.fonts.loginButtonFont
        
        switch type {
        case LoginConstants.parameter.userType:
            texto.keyboardType = .emailAddress
            texto.textContentType = .emailAddress
        case LoginConstants.parameter.passwordType:
           texto.isSecureTextEntry = true
            
        default:
            break
        }
        view.addSubview(texto)
    }
    func configureLoginButton(){
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = Constants.color.button
        loginButton.titleLabel?.font = Constants.fonts.firstTitleFont
        loginButton.setTitle(Constants.button.titleLoginButton, for: .normal)
        loginButton.layer.cornerRadius = Constants.button.cornerRadiusButton
        loginButton.addTarget(self, action: #selector(actionLogin), for: .touchDown)
        view.addSubview(loginButton)
    }
    @objc func actionLogin(){
        if usuarioLabel.text == LoginConstants.login.ususario, passwordLabel.text == LoginConstants.login.password{
            navigationController?.pushViewController(PagesViewController(viewDataSource: PagesViewDataSource(), viewDelegate: PagesViewDelegate()), animated: true)
        } else {
            
            let alertController = UIAlertController(title: LoginConstants.alert.title, message: LoginConstants.alert.message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: LoginConstants.alert.tittleAction, style: .default)
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
    func configureLayout(){
        NSLayoutConstraint.activate ([
            titleText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.layout.titleTop),
            titleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.layout.titleLeading),
            titleText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.layout.titleTrailing),
            usuarioLabel.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: LoginConstants.label.labelTop),
            usuarioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstants.label.labelLeading),
            lineText.topAnchor.constraint(equalTo: usuarioLabel.bottomAnchor, constant: LoginConstants.line.lineTextTop),
            lineText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstants.line.lineTextLeading),
            lineText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LoginConstants.line.lineTextTrailing),
            lineText.heightAnchor.constraint(equalToConstant: LoginConstants.line.lineTextHeight),
            symbolUser.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: LoginConstants.symbol.symbolTop),
            symbolUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstants.symbol.symbolLeading),
            passwordLabel.topAnchor.constraint(equalTo: lineText.bottomAnchor, constant: LoginConstants.label.labelTop),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstants.label.labelLeading),
            lineTextTwo.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: LoginConstants.line.lineTextTop),
            lineTextTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstants.line.lineTextLeading),
            lineTextTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LoginConstants.line.lineTextTrailing),
            lineTextTwo.heightAnchor.constraint(equalToConstant: LoginConstants.line.lineTextHeight),
            symbolPassword.topAnchor.constraint(equalTo: symbolUser.bottomAnchor, constant: LoginConstants.symbol.symbolTop),
            symbolPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LoginConstants.symbol.symbolLeading),
            symbolPrivacy.bottomAnchor.constraint(equalTo: lineTextTwo.topAnchor, constant: LoginConstants.symbol.symbolPrivacyBotton),
            symbolPrivacy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LoginConstants.symbol.symbolPrivacyTrailing),
            loginButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: Constants.layout.buttonTop),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.layout.buttonLeading),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.layout.buttonTrailing),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.layout.buttonHeight)
        ])
    }
}
