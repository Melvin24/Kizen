//
//  Menu.swift
//  Kizen
//
//  Created by Melvin John on 17/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

struct Menu {
    
    enum ItemType {
        case logs
        case progress
        case workout
        case more
    }
    
    let type: ItemType
    let title: String
    
}
