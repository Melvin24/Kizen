//
//  ExerciseViewModelFactory.swift
//  Kizen
//
//  Created by Melvin John on 10/05/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

struct ExerciseViewModelFactory {
    
    func makeExerciseViewModel(fromExercise exercise: Exercise) -> ExerciseViewModel {
        
        let imageName: String
        
        switch exercise.image {
        case .benchImage:
            imageName = "bench_image"
        case .deadliftImage:
            imageName = "deadlift_image"
        case .squatImage:
            imageName = "squat_image"
        }
        
        return ExerciseViewModel(name: exercise.name, imageName: imageName)
        
    }
    
}
