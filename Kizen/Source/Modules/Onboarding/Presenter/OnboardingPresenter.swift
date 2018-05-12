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
    
    var pages: [OnboardingPage] = []
    
    let rawValue: [Exercise]
    let exerciseViewModels: [ExerciseViewModel]
    
    init(exercises: [Exercise]) {
        self.rawValue = exercises
        self.exerciseViewModels = ExerciseViewModelsFactory().makeExerciseViewModels(fromExercises: exercises)
        
    }
    func loadIfRequired() {
        loadOnboardingPages()
    }
    
    private func loadOnboardingPages() {
        
        let pages = exerciseViewModels.compactMap { (exerciseViewModel: ExerciseViewModel) -> OnboardingPage? in
            
            guard let viewController = self.viewController,
                let destination = UIStoryboard.instantiateViewControllerFromStoryboard(withName: OnboardingPage.Storyboard.name) as? OnboardingPage else {
                    return nil
            }
            
            
            let coordinator = OnboardingPageNavigationCoordinator(source: viewController,
                                                                  destination: destination,
                                                                  exerciseViewModel: exerciseViewModel)
            
            coordinator.prepareForNavigation()
            
            return destination
        }

        self.pages += pages
        
    }
}
