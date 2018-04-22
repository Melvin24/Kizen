//
//  MainPresenter.swift
//  FruitViewer

import UIKit

class MainPresenter: Presenter {
    
    weak var viewController: MainTabBarController?
    
    let menuItems: [MenuViewModel]
    
    init(withMenuItems menuItems: [MenuViewModel]) {
        self.menuItems = menuItems
    }
    
    
    
    /// Call this method to load any required data.
    func loadIfRequired() {
        
        let viewControllerFactory = ViewControllerFactory()
        
        let fruitViewModel = FruitViewModel(fruit: Fruit(price: 12, type: .apple, weight: 12, image: nil, name: "apple"))
        
        let tabBarViewControllers: [UIViewController] = menuItems.flatMap {
            
            let tabBarViewController = viewControllerFactory.makeViewController(from: $0.menuType)
            tabBarViewController?.tabBarItem = UITabBarItem(title: $0.title, image: $0.icon, selectedImage: nil)
            
            let coordinator: Coordinatable = DetailedViewerNavigationCoordinator()
            
            let userInfo = (fruitViewModel: fruitViewModel, shouldHideDetails: false)
            
            try? coordinator.prepareForNavigation(source: self.viewController,
                                                  destination: tabBarViewController,
                                                  userInfo: userInfo)
            
            return tabBarViewController
            
        }
        
        self.viewController?.viewControllers = tabBarViewControllers
        
        
    }
}
