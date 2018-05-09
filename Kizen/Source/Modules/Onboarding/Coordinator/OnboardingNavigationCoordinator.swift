//
//  OnboardingNavigationCoordinator.swift
//  Kizen
//
//  Created by Melvin John on 28/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

struct OnboardingNavigationCoordinator: Coordinatable {
    
    let destination: OnboardingPageViewController
    
    func prepareForNavigation() {
        
        let presenter = OnboardingPresenter()
        
        presenter.viewController = destination
        
        destination.presenter = presenter
        
    }
    
}
