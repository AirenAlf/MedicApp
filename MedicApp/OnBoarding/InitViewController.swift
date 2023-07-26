import UIKit

class InitViewController: UIViewController {
    
    private var stackView = UIStackView()
    private var backImagen = UIImageView()
    private var titleText = UILabel()
    private var descriptionText = UILabel()
    
    init(Imagen: String, Text: String, Description: String) {
        super.init(nibName: nil, bundle: nil)
        
        backImagen.image = UIImage(named: Imagen)
        titleText.text = Text
        descriptionText.text = Description
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ColorBack")
        navigationItem.setHidesBackButton(true, animated: false)
        configureGroupElements()
    }
    func configureGroupElements(){
        configureStackView()
        configureBackImagen()
        configureTitleText()
        configureDescriptionText()
        configureLayout()
    }
    func configureStackView(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = CGFloat(30)
        view.addSubview(stackView)
    }
    func configureBackImagen(){
        backImagen.contentMode = .scaleAspectFill
        stackView.addArrangedSubview(backImagen)
    }
    func configureTitleText(){
        titleText.font = UIFont.boldSystemFont(ofSize: 20)
        titleText.textColor = UIColor.white
        titleText.numberOfLines = 0
        titleText.textAlignment = .center
        stackView.addArrangedSubview(titleText)
    }
    func configureDescriptionText(){
        descriptionText.font = UIFont.systemFont(ofSize: 16)
        descriptionText.textColor = UIColor.white
        descriptionText.numberOfLines = 0
        descriptionText.textAlignment = .center
        stackView.addArrangedSubview(descriptionText)
    }
    func configureLayout(){
        NSLayoutConstraint.activate ([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            backImagen.heightAnchor.constraint(equalToConstant: 200),
            titleText.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            descriptionText.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
}

