//
//  OnboardingPage.swift
//  Kizen
//
//  Created by Melvin John on 29/04/2018.
//  Copyright © 2018 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class OnboardingPage: UIViewController, CanInteractWithPresenter {
    
    var presenter: OnboardingPagePresenter!
    
    lazy var onboardingPageView: OnboardingPageView = {
        return UIView.loadViewFromNib(as: OnboardingPageView.self, owner: self)
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupSubview()
        
        presenter.loadIfRequired()
    }
    
    func setupSubview() {
        

        view.insertSubview(onboardingPageView, at: 0)
//        onboardingPageView.translatesAutoresizingMaskIntoConstraints = false
//
//        onboardingPageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        onboardingPageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        onboardingPageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        onboardingPageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

    }
}

extension OnboardingPage {
    
    /// Storyboard name
    enum Storyboard: String {
        case name = "OnboardingPage"
    }
    
}
