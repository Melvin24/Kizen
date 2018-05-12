//
//  AppDelegate.swift
//  FruitViewer

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let mainWindow = UIWindow(frame: UIScreen.main.bounds)
        
        guard let onboardingPageViewController = UIStoryboard.instantiateViewControllerFromStoryboard(withName: OnboardingPageViewController.Storyboard.name) as? OnboardingPageViewController else {
            return true
        }
        
        let exercises = [
            Exercise(name: "Deadlift", image: .deadliftImage),
            Exercise(name: "Bench", image: .benchImage),
            Exercise(name: "Squat", image: .squatImage)
        ]
        
        let navigationCoordinator = OnboardingNavigationCoordinator(destination: onboardingPageViewController, exercises: exercises)
        
        navigationCoordinator.prepareForNavigation()
        
        window = mainWindow
        
        window?.rootViewController = onboardingPageViewController
        window?.makeKeyAndVisible()
        
        return true
        
    }

}

