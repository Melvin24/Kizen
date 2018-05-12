//
//  OnboardingPageViewController.swift
//  Kizen
//
//  Created by Melvin John on 28/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIViewController, CanInteractWithPresenter{
    
    var presenter: OnboardingPresenter!
    
//    @IBOutlet var pageControl: UIPageControl!
    
    lazy var pageViewController: UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll,
                                    navigationOrientation: .horizontal,
                                    options: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageViewController()
        setupPageControl()
        
        presenter.loadIfRequired()

        if let firstOnboardPage = presenter.pages.first {
//            pageControl.currentPage = 0
            pageViewController.setViewControllers([firstOnboardPage], direction: .forward, animated: true)
        }

    }
    
    func setupPageViewController() {
        addChildViewController(pageViewController)
        
        view.addSubview(pageViewController.view)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor).isActive = true
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
                
    }
    
    func setupPageControl() {
        let apparence = UIPageControl.appearance()
//        pageControl.numberOfPages = presenter.pages.count
//
        apparence.pageIndicatorTintColor = .lightGray
        apparence.currentPageIndicatorTintColor = .darkGray
        apparence.backgroundColor = nil
    }
    
}



extension OnboardingPageViewController: UIPageViewControllerDelegate {
    

}

extension OnboardingPageViewController {
    enum Storyboard: String {
        case name = "Onboarding"
    }
}
