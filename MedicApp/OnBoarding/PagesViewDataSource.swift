import UIKit

class PagesViewDataSource: NSObject {

   weak var view: PagesViewController?
}
extension PagesViewDataSource: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let view = view else { return UIViewController() }
        
        guard let currentIndex = view.pages.firstIndex(of: viewController) else { return nil }
        if currentIndex != 0 {
            return view.pages[currentIndex - 1]
        } else {
            return nil
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let view = view else { return UIViewController() }
        guard let currentIndex = view.pages.firstIndex(of: viewController) else { return nil }
        if currentIndex < view.pages.count - 1{
            return view.pages[currentIndex + 1]
        } else {
            return nil
        }
    }
}
