import UIKit

class SplashViewController: UIViewController {

    private let screenUno = UIImageView()
    private var timerSplash = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ViewBackground")
        configureScreenUno()
        configureLayoutUno()
        configureTimer()
    }
    func configureTimer(){
        timerSplash = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            let viewController = HomeViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    func configureScreenUno(){
        screenUno.contentMode = .scaleAspectFill
        screenUno.image = UIImage(named: "Splash")
        screenUno.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(screenUno)
    }
    func configureLayoutUno(){
        NSLayoutConstraint.activate ([
            screenUno.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenUno.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            screenUno.heightAnchor.constraint(equalToConstant: 223),
            screenUno.widthAnchor.constraint(equalToConstant: 223)
            
        ])
    }
}

