//
//  OnboardingPresenter.swift
//  Kizen
//
//  Created by Melvin John on 28/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class OnboardingPresenter: Presenter {
    
    weak var viewController: OnboardingPageViewController?
    
    lazy var pages: [OnboardingPage] = [
        self.onboardingPage(),
        self.onboardingPage(),
        self.onboardingPage()
    ]
    
    func loadIfRequired() {
        _ = pages
    }
    
    func onboardingPage() -> OnboardingPage {

        guard let viewController = self.viewController,
            let destination = UIStoryboard.instantiateViewControllerFromStoryboard(withName: OnboardingPage.Storyboard.name) as? OnboardingPage else {
                fatalError("should instantiate OnboardingPage")
        }
        
        let coordinator = OnboardingPageNavigationCoordinator(source: viewController, destination: destination)
        
        coordinator.prepareForNavigation()

        return destination
        
    }
}
