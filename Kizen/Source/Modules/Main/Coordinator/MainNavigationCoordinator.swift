//
//  MainNavigationCoordinator.swift
//  FruitViewer

import UIKit

struct MainNavigationCoordinator: Coordinatable {
    
    let destination: MainTabBarController
    
    func prepareForNavigation() {
        
        let menuItems = [Menu(type: .logs, title: "Logs"),
                         Menu(type: .progress, title: "Progress"),
                         Menu(type: .workout, title: "Workout"),
                         Menu(type: .more, title: "More")]
        
        
        let presenter = MainPresenter(withMenuItems: MenuViewModelFactory().makeMenuViewModels(fromMenu: menuItems))
        
        presenter.viewController = destination
        
        destination.presenter = presenter
    }
}
