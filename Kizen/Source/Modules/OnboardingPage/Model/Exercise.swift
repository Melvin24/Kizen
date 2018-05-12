//
//  Exercise.swift
//  Kizen
//
//  Created by Melvin John on 10/05/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

struct Exercise {
    
    enum Image: String {
        case squatImage
        case benchImage
        case deadliftImage
    }
    
    let name: String
    let image: Image
    
}
