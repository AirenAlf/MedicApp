import UIKit

class HomeListDoctorApiRepository : HomeListDoctorRepository {
    
    var networkApi : HomeListDoctorResApi
    
    init(networkApi: HomeListDoctorResApi) {
        self.networkApi = networkApi
    }
    
    func execute(completionHandler: @escaping (Result<MedicModel, Error>) -> Void) {
        networkApi.execute(completionHandler: completionHandler)
    }
    
    
}
