import UIKit

protocol LoadingSpinnerView : AnyObject {
    func showSpinner()
    func hiddenSpinner()
}

extension LoadingSpinnerView where Self: UIViewController {
    
    func showSpinner() {
        let content = UIView()
        let spinner = UIActivityIndicatorView(style: .large)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = UIColor(named: "ColorButton")
        
        content.addSubview(spinner)
        content.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(content)
        
        NSLayoutConstraint.activate([
        
            content.topAnchor.constraint(equalTo: view.topAnchor),
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            spinner.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: content.centerYAnchor)
            
        ])
 
        content.backgroundColor = .white
        content.tag = 120
        spinner.startAnimating()
        
        
    }
    func hiddenSpinner() {
        if let removed = view.viewWithTag(120){
            removed.removeFromSuperview()
        }
    }

}

/* func configureLoading(){
    let isLoading = true
    if isLoading == true {
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }
   
    loadingView.frame = view.bounds
    loadingView.backgroundColor = UIColor.white
    activityIndicator.style = .large
    activityIndicator.color = UIColor(named: "ColorButton")
    activityIndicator.center = loadingView.center
    loadingView.addSubview(activityIndicator)
    view.addSubview(loadingView) }*/
   
    

//private var loadingView = UIView()
// private var activityIndicator = UIActivityIndicatorView()
