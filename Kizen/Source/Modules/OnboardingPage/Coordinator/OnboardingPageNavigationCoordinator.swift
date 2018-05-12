//
//  OnboardingPageNavigationCoordinator.swift
//  Kizen
//
//  Created by Melvin John on 29/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

struct OnboardingPageNavigationCoordinator: Coordinatable {
    
    let source: OnboardingPageViewController
    let destination: OnboardingPage
    let exerciseViewModel: ExerciseViewModel
    
    func prepareForNavigation() {
        
        let presenter = OnboardingPagePresenter(exerciseViewModel: exerciseViewModel)
        
        presenter.viewController = destination
        
        destination.presenter = presenter
        
    }
    
}
