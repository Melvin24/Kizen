//
//  MenuViewModel.swift
//  Kizen
//
//  Created by Melvin John on 17/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

struct MenuViewModel {
    
    let menuType: Menu.ItemType
    let title: String
    
    var icon: UIImage {
        
        let menuTypeIcon: UIImage
        
        switch menuType {
        case .logs:
            menuTypeIcon = #imageLiteral(resourceName: "note")
        case .progress:
            menuTypeIcon = #imageLiteral(resourceName: "note")
        case .workout:
            menuTypeIcon = #imageLiteral(resourceName: "note")
        case .more:
            menuTypeIcon = #imageLiteral(resourceName: "note")
        }
        
        return menuTypeIcon
        
    }
    
}
