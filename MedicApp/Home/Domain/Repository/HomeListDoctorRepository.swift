import UIKit

protocol HomeListDoctorRepository {
    func execute(completionHandler: @escaping (Result<MedicModel, Error>) -> Void ) 
}
