//
//  OnboardingPageViewController+UIPageViewControllerDataSource.swift
//  Kizen
//
//  Created by Melvin John on 10/05/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewController = viewController as? OnboardingPage,
            let viewControllerIndex = presenter.pages.index(of: currentViewController) else {
                return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard presenter.pages.count > previousIndex else {
            return nil
        }
        
        return presenter.pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewController = viewController as? OnboardingPage,
            let viewControllerIndex = presenter.pages.index(of: currentViewController) else {
                return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < presenter.pages.count else {
            return nil
        }
        
        guard presenter.pages.count > nextIndex else {
            return nil
        }
        
        return presenter.pages[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return presenter.pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currentViewController = pageViewController.presentedViewController as? OnboardingPage,
            let viewControllerIndex = presenter.pages.index(of: currentViewController) else {
            return 0
        }
        
        return viewControllerIndex
    }

}
