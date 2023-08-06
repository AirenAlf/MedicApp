import UIKit

class HomeListDoctorUseCase {
    
    var repository : HomeListDoctorRepository
    
    init(repository: HomeListDoctorRepository) {
        self.repository = repository
    }
    
    func execute(completionHandler: @escaping (Result<MedicModel, Error>) -> Void ) {
        repository.execute { result in
            completionHandler(result)
        }
    }
}
