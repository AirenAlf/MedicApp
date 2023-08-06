import UIKit

class HomeViewDataSource: NSObject {
    
    weak var view: HomeViewProtocol?
}
extension HomeViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let view = view else { return 0 }
        return view.doctorsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let view = view,  let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell", for: indexPath) as? UserListCell else { return UITableViewCell() }
        let data = view.doctorsList[indexPath.row]
        
        cell.setupData(Image: data.imageURL, name: data.name, ocupation: data.categoryName, experiency: data.experiency)
        
        return cell
    }
}
