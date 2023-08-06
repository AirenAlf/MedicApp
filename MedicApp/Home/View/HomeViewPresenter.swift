import UIKit

class HomeViewPresenter : HomeViewPresenterProtocol {
    
    weak var viewController : HomeViewProtocol?
    var useCase : HomeListDoctorUseCase
    
    init(useCase: HomeListDoctorUseCase) {
        self.useCase = useCase
    }
    
    func attach(viewController: HomeViewProtocol) {
        self.viewController = viewController
    }
    
    func successDataListDoctor() {
        self.useCase.execute { [weak self] response in
            switch response {
            case let .success(model):
                self?.viewController?.getDataListDoctor(listDoctor: model )
            case let .failure(nilModel):
                print(nilModel)
                
            }
          
        }
    }
    
    
}
