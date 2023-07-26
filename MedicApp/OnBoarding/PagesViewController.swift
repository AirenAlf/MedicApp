import UIKit

class PagesViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    private var skipButton = UIButton(type: .system)
    
    private let viewDataSource: PagesViewDataSource?
    private let viewDelegate: PagesViewDelegate?
    
    init(viewDataSource: PagesViewDataSource, viewDelegate: PagesViewDelegate) {
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
        super.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal)
        self.viewDataSource?.view = self
        self.viewDelegate?.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationItem.setHidesBackButton(true, animated: false)
        super.viewDidLoad()
        dataSource = viewDataSource
        delegate = viewDelegate
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
        skipButton.addTarget(self, action: #selector(nextMenu), for: .touchDown)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: skipButton)
    }
    @objc func nextMenu(){
        let nextMenu = HomeViewController()
        self.navigationController?.pushViewController(nextMenu, animated: true)
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


