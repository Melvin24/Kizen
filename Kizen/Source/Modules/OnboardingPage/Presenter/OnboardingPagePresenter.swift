//
//  OnboardingPagePresenter.swift
//  Kizen
//
//  Created by Melvin John on 29/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

class OnboardingPagePresenter: Presenter {
    
    weak var viewController: OnboardingPage?
    
    let exerciseViewModel: ExerciseViewModel
    
    init(exerciseViewModel: ExerciseViewModel) {
        self.exerciseViewModel = exerciseViewModel
    }
    
    func loadIfRequired() {
        
    }
    
}
