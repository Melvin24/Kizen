//
//  ViewControllerFactory.swift
//  Kizen
//
//  Created by Melvin John on 19/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

struct ViewControllerFactory {
    
    func makeViewController(from type: Menu.ItemType) -> UIViewController? {
        switch type {
        case .logs:
            
            return UIStoryboard.instantiateViewControllerFromStoryboard(withName: DetailedViewerViewController.Storyboard.name) as? DetailedViewerViewController
        case .progress:
            
            return UIStoryboard.instantiateViewControllerFromStoryboard(withName: DetailedViewerViewController.Storyboard.name) as? DetailedViewerViewController
        case .workout:
            
            return UIStoryboard.instantiateViewControllerFromStoryboard(withName: DetailedViewerViewController.Storyboard.name) as? DetailedViewerViewController
        case .more:
            
            return UIStoryboard.instantiateViewControllerFromStoryboard(withName: DetailedViewerViewController.Storyboard.name) as? DetailedViewerViewController
        }
    }
    
}
