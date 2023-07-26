import UIKit
import Kingfisher

class UserListCell : UITableViewCell {
    
    private var content = UIView()
    private var stackContent = UIStackView()
    private var stackImagen = UIStackView()
    private var nameLabel = UILabel()
    private var ocupationLabel = UILabel()
    private var userImage = UIImageView()
    private var experiencyLabel = UILabel()
    
    override init (style : UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        configureContent()
        configureStack()
        configureStackImagen()
        configureImage()
        configureNameLabel()
        configureOcupationLabel()
        configureExperiencyLabel()
        configureConstrains()
        
        func configureContent(){
            content.translatesAutoresizingMaskIntoConstraints = false
            content.layer.cornerRadius = 5
            content.clipsToBounds = true
            content.layer.borderWidth = 1
            content.layer.borderColor = .init(red: 1/250, green: 1/250, blue: 1/250, alpha: 1)
            contentView.addSubview(content)
        }
        func configureStack(){
            stackContent.translatesAutoresizingMaskIntoConstraints = false
            stackContent.axis = .vertical
            stackContent.spacing = 5
            content.addSubview(stackContent)
        }
        func configureImage(){
            userImage.translatesAutoresizingMaskIntoConstraints = false
            stackImagen.addArrangedSubview(userImage)
        }
        func configureStackImagen(){
            stackImagen.translatesAutoresizingMaskIntoConstraints = false
            content.addSubview(stackImagen)
        }
        func configureNameLabel(){
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.font = .boldSystemFont(ofSize: 16)
            nameLabel.numberOfLines = 0
            stackContent.addArrangedSubview(nameLabel)
        }
        func configureOcupationLabel(){
            ocupationLabel.translatesAutoresizingMaskIntoConstraints = false
            ocupationLabel.font = .systemFont(ofSize: 16)
            ocupationLabel.numberOfLines = 0
            stackContent.addArrangedSubview(ocupationLabel)
        }
        func configureExperiencyLabel(){
            experiencyLabel.translatesAutoresizingMaskIntoConstraints = false
            experiencyLabel.font = .systemFont(ofSize: 16)
            experiencyLabel.numberOfLines = 0
            stackContent.addArrangedSubview(experiencyLabel)
        }
        func configureConstrains(){
            NSLayoutConstraint.activate ([
                content.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                
                stackContent.topAnchor.constraint(equalTo: content.topAnchor, constant: 10),
                stackContent.leadingAnchor.constraint(equalTo: stackImagen.trailingAnchor, constant: 10),
                stackContent.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -10),
                stackContent.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -10),
                
                stackImagen.topAnchor.constraint(equalTo: content.topAnchor, constant: 5),
                stackImagen.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 5),
                stackImagen.trailingAnchor.constraint(equalTo: stackContent.leadingAnchor, constant: -5),
                stackImagen.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -5),
                stackImagen.widthAnchor.constraint(equalToConstant: 70),
                stackImagen.heightAnchor.constraint(equalToConstant: 70),
            ])
        }
    }
    func setupData (Image: String, name: String, ocupation: String, experiency: String) {
        userImage.kf.setImage(with: URL(string: Image))
        nameLabel.text = name
        ocupationLabel.text = ocupation
        experiencyLabel.text = experiency
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
