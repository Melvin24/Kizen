//
//  OnboardingPageViewController.swift
//  Kizen
//
//  Created by Melvin John on 28/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, CanInteractWithPresenter{
    
    var presenter: OnboardingPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        presenter.loadIfRequired()
        
        if let firstOnboardPage = presenter.pages.first {
            setViewControllers([firstOnboardPage], direction: .forward, animated: true)
        }
    }
    
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewController = viewController as? OnboardingPage,
            let viewControllerIndex = presenter.pages.index(of: currentViewController) else {
                return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return presenter.pages.last
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
            return presenter.pages.first
        }
        
        guard presenter.pages.count > nextIndex else {
            return nil
            
        }
        
        return presenter.pages[nextIndex]
        
    }
    
    
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
    
}

extension OnboardingPageViewController {
    enum Storyboard: String {
        case name = "Onboarding"
    }
}
