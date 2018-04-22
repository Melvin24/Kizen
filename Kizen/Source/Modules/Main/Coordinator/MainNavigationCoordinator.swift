//
//  MainNavigationCoordinator.swift
//  FruitViewer

import Foundation

class MainNavigationCoordinator: Coordinatable {
    
    func prepareForNavigation<From, To>(source: From, destination: To, userInfo: Any?) throws {
        
        guard let destination = destination as? MainTabBarController else {
            throw CoordinateError.unsupported("Coordination isnt supported")
        }
        
        let menuItems = [Menu(type: .logs, title: "Logs"),
                         Menu(type: .progress, title: "Progress"),
                         Menu(type: .workout, title: "Workout"),
                         Menu(type: .more, title: "More")]
        
        
        let presenter = MainPresenter(withMenuItems: MenuViewModelFactory().makeMenuViewModels(fromMenu: menuItems))
        
        presenter.viewController = destination
        
        destination.presenter = presenter
    }
}
