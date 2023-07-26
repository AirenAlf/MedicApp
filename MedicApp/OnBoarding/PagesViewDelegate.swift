import UIKit

class PagesViewDelegate: NSObject {

   weak var view: PagesViewController?
}

extension PagesViewDelegate: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        
        guard let view = view else { return }
        guard let viewController = pageViewController.viewControllers else { return }
        guard let currentIndex = view.pages.firstIndex(of: viewController[0]) else { return }
        view.pageControl.currentPage = currentIndex
    
        }
    }
