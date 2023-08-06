import UIKit

protocol HomeViewProtocol : AnyObject {
    var doctorsList : [Doctor] {get}
    
    func getDataListDoctor(listDoctor : MedicModel)
    func spinnerShow()
    func spinnerHiddden()
    func showAlertError()
    
}
