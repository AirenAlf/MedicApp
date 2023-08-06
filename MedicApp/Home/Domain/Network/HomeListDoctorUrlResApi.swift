import UIKit

class HomeListDoctorUrlResApi : HomeListDoctorResApi {
    func execute(completionHandler: @escaping (Result<MedicModel, Error>) -> Void) {
        guard let url = URL(string: Constants.url.url) else {return}
        
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with:url){data, response, error in
            if let dataSafe = data {
                guard let convertionData = try? JSONDecoder().decode(MedicModel.self, from: dataSafe) else {return}
                completionHandler(.success(convertionData))
            } else if let error = error {
                completionHandler(.failure(error))
            }
        }.resume()
    }
}

