import UIKit

class PagesViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    private var skipButton = UIButton(type: .system)
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationItem.setHidesBackButton(true, animated: false)
        super.viewDidLoad()
        dataSource = self
        delegate = self
        view.backgroundColor = .blue
        configureSkipButton()
        SetViewC()
        configurePageControl()
        configureLayoutUno()
    }
    
    @objc func tabBarPush(){
        let tabBarController = HomeViewController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }
    func configureSkipButton(){
        skipButton.setTitle("Saltar", for: .normal)
        skipButton.setTitleColor(.white, for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: skipButton)
    }
    func SetViewC(){
        let firstPage = InitViewController(Imagen: "Doctors", Text: "Especialistas", Description: "Ver  los especialistas medicos que hay disponibles para agendar tu cita.")
        
        let secondPage = InitViewController(Imagen: "imagenMenuTwo", Text: "Generar Citas", Description: "Realizar  citas medicas  con fecha y hora  a tu elección.")
        
        let thirdPage = InitViewController(Imagen: "imagenMenuThree", Text: "Asistencia", Description: "Paga, asiste a la cita  y recibe instructucciones por parte del personal medico.")
        pages = [firstPage, secondPage, thirdPage]
        setViewControllers([pages[0]], direction: .forward, animated: false)
    }
    
    func configurePageControl(){
    
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
    }
    func configureLayoutUno(){
        NSLayoutConstraint.activate ([
            pageControl.widthAnchor.constraint(equalToConstant: 200),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}

extension PagesViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex != 0 {
            return pages[currentIndex - 1]
        } else {
            
            return nil
            
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return nil
        }
    }
}

extension PagesViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewController = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewController[0]) else { return }
        pageControl.currentPage = currentIndex
    
        }
    }

