import UIKit

class SplashViewController: UIViewController, LoadingSpinnerView {

    private let splashImage = UIImageView()
    private var timerSplash = Timer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.color.background
        showSpinner()
        configureTimer()
        configureImage()
        configureLayoutUno()
    }
   
    func configureImage() {
        splashImage.contentMode = .scaleAspectFill
        splashImage.image = Constants.image.splash
        splashImage.alpha = SplashConstants.image.alpha
        splashImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(splashImage)
    }
    
    func configureTimer() {
        timerSplash = Timer.scheduledTimer(withTimeInterval: SplashConstants.timer.intervalTime, repeats: false) { timer in
            self.hiddenSpinner()
            let viewController = LoginViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func configureLayoutUno() {
        NSLayoutConstraint.activate ([
            splashImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            splashImage.heightAnchor.constraint(equalToConstant: SplashConstants.image.height),
            splashImage.widthAnchor.constraint(equalToConstant: SplashConstants.image.width)
        ])
    }
}

