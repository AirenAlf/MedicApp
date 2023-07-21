import UIKit


class LoginViewController: UIViewController {
    
    private var skipButton = UIButton(type: .system)
    private var titleText = UILabel()
    private var usuarioLabel = UITextField()
    private var passwordLabel = UITextField()
    private var lineText = UIView()
    private var lineTextTwo = UIView()
    private var imagenUsuario = UIImageView()
    private var imagenPassword = UIImageView()
    private var imagenPrivate = UIImageView()
    private var loginButton = UIButton()
    private let privacyButton = UIButton(type: .custom)


    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = UIColor(named: "ViewBackground")
        configureSkipButton()
        configureTitleText()
        configureLabel(texto: usuarioLabel, placeholder: "Correo electrónico", type: "email")
        configureLabel(texto: passwordLabel, placeholder: "Contraseña", type: "password")
        configureLineText()
        configureLineTextTwo()
        configureImagenUsuario()
        configureImagenPassword()
        configureToggleButton()
        configureLoginButton()
        configureLayout()
        
    }
    func configureToggleButton(){
        privacyButton.translatesAutoresizingMaskIntoConstraints = false
        privacyButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        privacyButton.tintColor = .lightGray
        privacyButton.addTarget(self, action: #selector(PasswordVisibility), for: .touchDown)
        privacyButton.addTarget(self, action: #selector(PasswordNoVisibility), for: .touchUpInside)
            view.addSubview(privacyButton)
        }

        @objc func PasswordVisibility() {
            passwordLabel.isSecureTextEntry = false
            let buttonImage = UIImage(systemName: "eye")
            privacyButton.setImage(buttonImage, for: .normal)
        
        }
    @objc func PasswordNoVisibility() {
        passwordLabel.isSecureTextEntry = true
        let buttonImage = UIImage(systemName: "eye.slash")
        privacyButton.setImage(buttonImage, for: .normal)
    
    }
    
    
    func configureSkipButton(){
        skipButton.setTitle("Saltar", for: .normal)
        skipButton.setTitleColor(.black, for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: skipButton)
    }
    func configureTitleText(){
      
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.text = "Bienvenido(a) \n Consultorio Medico"
        titleText.font = UIFont.boldSystemFont(ofSize: 20)
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
        imagenUsuario.translatesAutoresizingMaskIntoConstraints = false
        imagenUsuario.image = UIImage(named: "Sobre")
        view.addSubview(imagenUsuario)
    }
    func configureImagenPassword(){
        imagenPassword.translatesAutoresizingMaskIntoConstraints = false
        imagenPassword.image = UIImage(named: "Candado")
        view.addSubview(imagenPassword)
    }
    
    func configureLabel(texto : UITextField, placeholder: String, type: String){
        texto.translatesAutoresizingMaskIntoConstraints = false
        texto.placeholder = placeholder
        texto.font = .systemFont(ofSize: 12)
        
        switch type {
        case "email":
            texto.keyboardType = .emailAddress
            texto.textContentType = .emailAddress
        case "password":
           texto.isSecureTextEntry = true
            
        default:
            break
        }
        view.addSubview(texto)
    }
    
    func configureLoginButton(){
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = UIColor(named: "ColorButton")
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
        loginButton.setTitle("Ingresar", for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(actionLogin), for: .touchDown)
        view.addSubview(loginButton)
    }

    @objc func actionLogin(){
        if usuarioLabel.text == "A", passwordLabel.text == "1"{
            navigationController?.pushViewController(PagesViewController(), animated: true)
        } else {
            
            let alertController = UIAlertController(title: "Atención", message: "Correo y/o contraseña son incorrectas", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
        
    }
    
    func configureLayout(){
        NSLayoutConstraint.activate ([
            
            titleText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            
            usuarioLabel.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 50),
            usuarioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            
            lineText.topAnchor.constraint(equalTo: usuarioLabel.bottomAnchor, constant: 5),
            lineText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            lineText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            lineText.heightAnchor.constraint(equalToConstant: 1),
            
            imagenUsuario.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 50),
            imagenUsuario.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: lineText.bottomAnchor, constant: 50),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            
            lineTextTwo.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            lineTextTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            lineTextTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            lineTextTwo.heightAnchor.constraint(equalToConstant: 1),
            
            imagenPassword.topAnchor.constraint(equalTo: imagenUsuario.bottomAnchor, constant: 50),
            imagenPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            privacyButton.bottomAnchor.constraint(equalTo: lineTextTwo.topAnchor, constant: -5),
            privacyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
            loginButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            loginButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
}
