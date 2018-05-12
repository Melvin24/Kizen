//
//  ExerciseViewModelsFactory.swift
//  Kizen
//
//  Created by Melvin John on 10/05/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

struct ExerciseViewModelsFactory {
    
    func makeExerciseViewModels(fromExercises exercises: [Exercise]) -> [ExerciseViewModel] {
        
        let factory = ExerciseViewModelFactory()
        
        return exercises.map(factory.makeExerciseViewModel)
        
    }
    
}
