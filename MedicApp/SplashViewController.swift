import UIKit

class SplashViewController: UIViewController {

    private let screenUno = UIImageView()
    private var timerSplash = Timer()
    private var loadingView = UIView()
    private var activityIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureTimer()
        configureLoading()
        configureLayoutUno()
        
    }
   
    
    func configureLoading(){
        let isLoading = true
        if isLoading == true {
            loadingView.isHidden = false
            activityIndicator.startAnimating()
        }
        screenUno.contentMode = .scaleAspectFill
        screenUno.image = UIImage(named: "Splash")
        screenUno.alpha = 0.5
        screenUno.translatesAutoresizingMaskIntoConstraints = false
        loadingView.frame = view.bounds
        loadingView.backgroundColor = UIColor.white
        activityIndicator.style = .large
        activityIndicator.color = UIColor(named: "ColorButton")
        activityIndicator.center = loadingView.center
        loadingView.addSubview(activityIndicator)
        view.addSubview(loadingView)
        view.addSubview(screenUno)
    }
    func configureTimer(){
        timerSplash = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            let viewController = LoginViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
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

