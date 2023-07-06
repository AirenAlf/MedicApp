
import UIKit

class MenuThreeViewController: UIViewController {
    private var backImagen = UIImageView()
    private var skipButton = UIButton(type: .system)
    private var titleText = UILabel()
    private var descriptionText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ColorBack")
        navigationItem.setHidesBackButton(true, animated: false)
        configureBackImagen()
        configureSkipButton()
        configureTitleText()
        configureDescriptionText()
        configureLayout()
        
    }
    
    func configureBackImagen(){
        backImagen.translatesAutoresizingMaskIntoConstraints = false
        backImagen.image = UIImage(named: "imagenMenuThree")
        backImagen.contentMode = .scaleAspectFill
        view.addSubview(backImagen)
    }
    func configureSkipButton(){
        skipButton.setTitle("Saltar", for: .normal)
        skipButton.setTitleColor(.white, for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: skipButton)
    }
    func configureTitleText(){
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.text = "ASISTENCIA"
        titleText.font = UIFont.boldSystemFont(ofSize: 20)
        titleText.textColor = UIColor.white
        titleText.numberOfLines = 0
        titleText.textAlignment = .center
        view.addSubview(titleText)
    }
    func configureDescriptionText(){
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.text = "Paga, asiste a la cita  y recibe \n instructucciones por parte del \n personal medico."
        descriptionText.font = UIFont.systemFont(ofSize: 16)
        descriptionText.textColor = UIColor.white
        descriptionText.numberOfLines = 0
        descriptionText.textAlignment = .center
        view.addSubview(descriptionText)
    }
    func configureLayout(){
        NSLayoutConstraint.activate ([
            backImagen.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            backImagen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backImagen.heightAnchor.constraint(equalToConstant: 150),
            backImagen.widthAnchor.constraint(equalToConstant: 250),
            
            titleText.topAnchor.constraint(equalTo: backImagen.bottomAnchor, constant: 40),
            titleText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 30),
            descriptionText.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
