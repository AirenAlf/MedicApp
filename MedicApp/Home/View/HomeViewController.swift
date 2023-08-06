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
extension HomeViewController : HomeViewProtocol {
   
    func getDataListDoctor(listDoctor: MedicModel) {
        doctorsList = listDoctor.doctors
        DispatchQueue.main.async {
            self.listUserTable.reloadData()
        }
    }
}

