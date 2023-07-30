import UIKit

class HomeListDoctorResApi {
    func execute(completionHandler: @escaping (Result<MedicModel, Error>) -> Void ) {
        guard let url = URL(string: "https://run.mocky.io/v3/ac356bbe-88cd-4dcb-98a9-15d9fb4243dd") else {return}
        
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
