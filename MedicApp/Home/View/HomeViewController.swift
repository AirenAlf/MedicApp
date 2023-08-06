import UIKit
import Kingfisher

class HomeViewController: UIViewController  {
    
    var listUserTable = UITableView()
    var doctorsList : [Doctor] = []
    
    var viewDataSource : HomeViewDataSource?
    var presenter : HomeViewPresenterProtocol?
    
    
    convenience init(viewDataSource: HomeViewDataSource, presenter: HomeViewPresenterProtocol) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDataSource?.view = self
        self.presenter = presenter
        self.presenter?.attach(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        configureTableView()
        configureList()
        presenter?.successDataListDoctor()
    }
    
    func configureTableView(){
        listUserTable.translatesAutoresizingMaskIntoConstraints = false
        listUserTable.dataSource = viewDataSource
        listUserTable.register(UserListCell.self, forCellReuseIdentifier: "UserListCell")
        view.addSubview(listUserTable)
    }
    
    func configureList(){
        NSLayoutConstraint.activate ([
            
            listUserTable.topAnchor.constraint(equalTo: view.topAnchor),
            listUserTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listUserTable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            listUserTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
extension HomeViewController : HomeViewProtocol, LoadingSpinnerView {
    
    func spinnerShow() {
        DispatchQueue.main.async{ [weak self] in
            self?.showSpinner()
        }
    }
    
    func spinnerHiddden() {
        DispatchQueue.main.async { [weak self] in
            self?.hiddenSpinner()
        }
    }
    
    func showAlertError() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: "En estos momentos no es posible cargar la informacion", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Volver a intentar", style: .default) { action in
               
                // Cambiamos la url y despues que el usuario le de al boton intentar de nuevo, cargue la informacion
                
                Constants.url.url = "https://run.mocky.io/v3/ac356bbe-88cd-4dcb-98a9-15d9fb4243dd"
                self.presenter?.successDataListDoctor()
            }
          
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
    
    func getDataListDoctor(listDoctor: MedicModel) {
        doctorsList = listDoctor.doctors
        DispatchQueue.main.async {
            self.listUserTable.reloadData()
        }
    }
}

