import UIKit

protocol HomeViewProtocol : AnyObject {
    var doctorsList : [Doctor] {get}
    
    func getDataListDoctor(listDoctor : MedicModel)
    
}
