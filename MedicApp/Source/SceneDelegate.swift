//
//  SceneDelegate.swift
//  MedicApp
//
//  Created by Airen Alfonzo on 02/07/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        let viewController = createTabBar()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
    }
    func createHomeNC() -> UINavigationController {
        let network = HomeListDoctorUrlResApi()
        let repository = HomeListDoctorApiRepository(networkApi: network)
        let useCase = HomeListDoctorUseCase(repository: repository)
        let homeVC = HomeViewController(viewDataSource: HomeViewDataSource(), presenter: HomeViewPresenter(useCase: useCase))
        homeVC.tabBarItem = UITabBarItem(title: "Inicio", image: TabBarConstants.images.homeTabbar, tag: 0)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorito", image: TabBarConstants.images.FavTabBar, tag: 1)
        
        return UINavigationController(rootViewController: favoritesVC)
    }
    
    func createCalenderNC() -> UINavigationController {
        let calendarVC = CalendarViewController()
        calendarVC.tabBarItem = UITabBarItem(title: "Calendario", image: TabBarConstants.images.CalTabBar, tag: 2)
        
        return UINavigationController(rootViewController: calendarVC)
    }
    
    func createSesionNC() -> UINavigationController {
        let sesionVC = SesionViewController()
        sesionVC.tabBarItem = UITabBarItem(title: "Sesion", image: TabBarConstants.images.ProfTabBar, tag: 3)
        
        return UINavigationController(rootViewController: sesionVC)
    }
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = TabBarConstants.color.tabBar
        tabBar.viewControllers = [createHomeNC(), createFavoritesNC(),createCalenderNC(),createSesionNC()]
        
        return tabBar
        
    }
        func sceneDidDisconnect(_ scene: UIScene) {
            // Called as the scene is being released by the system.
            // This occurs shortly after the scene enters the background, or when its session is discarded.
            // Release any resources associated with this scene that can be re-created the next time the scene connects.
            // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        }
        
        func sceneDidBecomeActive(_ scene: UIScene) {
            // Called when the scene has moved from an inactive state to an active state.
            // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        }
        
        func sceneWillResignActive(_ scene: UIScene) {
            // Called when the scene will move from an active state to an inactive state.
            // This may occur due to temporary interruptions (ex. an incoming phone call).
        }
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            // Called as the scene transitions from the background to the foreground.
            // Use this method to undo the changes made on entering the background.
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.
        }
        
        
    }
    

