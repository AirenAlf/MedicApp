import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    
    var listUserTable = UITableView()
    var doctorsList : [Doctor] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        execute()
        configureTableView()
        configureList()
    }
    
    func configureTableView(){
        listUserTable.translatesAutoresizingMaskIntoConstraints = false
        listUserTable.dataSource = self
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
extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return doctorsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell", for: indexPath) as! UserListCell
        let data = doctorsList[indexPath.row]
     
        cell.setupData(Image: data.imageURL, name: data.name, ocupation: data.categoryName, experiency: data.experiency)
        
        return cell

    }
}

extension HomeViewController {
    func execute() {
        guard let url = URL(string: "https://run.mocky.io/v3/ac356bbe-88cd-4dcb-98a9-15d9fb4243dd") else {return}
        
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with:url){data, response, error in
            
            if let dataSafe = data {
                guard let convertionData = try? JSONDecoder().decode(MedicModel.self, from: dataSafe) else {return}
                self.doctorsList = convertionData.doctors
            }
            DispatchQueue.main.async {
                self.listUserTable.reloadData()
            }
        }.resume()
    }
}
