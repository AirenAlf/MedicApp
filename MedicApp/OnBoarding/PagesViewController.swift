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
    
    func configureSkipButton(){
        skipButton.setTitle(Constants.button.buttonTitle, for: .normal)
        skipButton.setTitleColor(.white, for: .normal)
        skipButton.addTarget(self, action: #selector(nextMenu), for: .touchDown)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: skipButton)
    }
    
    @objc func nextMenu(){
        
        let network = HomeListDoctorUrlResApi()
        let repository = HomeListDoctorApiRepository(networkApi: network)
        let useCase = HomeListDoctorUseCase(repository: repository)
        
        let nextMenu = HomeViewController(viewDataSource: HomeViewDataSource(),
                                          presenter: HomeViewPresenter(useCase: useCase))
        self.navigationController?.pushViewController(nextMenu, animated: true)
    }
    
    func SetViewC(){
        let firstPage = InitViewController( Imagen: PagesConstants.firstPage.image, Text: PagesConstants.firstPage.text, Description: PagesConstants.firstPage.description)
        
        let secondPage = InitViewController(Imagen: PagesConstants.secondPage.image, Text: PagesConstants.secondPage.text, Description: PagesConstants.secondPage.description)
        
        let thirdPage = InitViewController(Imagen: PagesConstants.thirdPage.image, Text: PagesConstants.thirdPage.text, Description: PagesConstants.thirdPage.description)
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
            pageControl.widthAnchor.constraint(equalToConstant: PagesConstants.pagesLayout.widthPC),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: PagesConstants.pagesLayout.bottomPC),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


