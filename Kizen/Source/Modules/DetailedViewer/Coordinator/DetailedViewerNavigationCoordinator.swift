//
//  DetailedViewerNavigationCoordinator.swift
//  FruitViewer

import UIKit

/// Navigation coordinator for Detailed Viewer, used for dependency injection. 
struct DetailedViewerNavigationCoordinator: Coordinatable {
    
    typealias UserInfo = (fruitViewModel: FruitViewModel, shouldHideDetails: Bool)
    
    let destination: DetailedViewerViewController
    let userInfo: UserInfo
    
    func prepareForNavigation() {

        let presenter = DetailedViewerPresenter(withFruitViewModel: userInfo.fruitViewModel,
                                                shouldHideDetails: userInfo.shouldHideDetails)
        
        presenter.viewController = destination
        
        destination.presenter = presenter
        
    }

}
