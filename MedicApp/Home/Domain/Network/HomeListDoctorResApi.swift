import UIKit

protocol HomeListDoctorResApi {
    func execute(completionHandler: @escaping (Result<MedicModel, Error>) -> Void ) 
        
}
