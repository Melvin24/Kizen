//
//  DetailedViewerViewController.swift
//  FruitViewer

import UIKit

class DetailedViewerViewController: UIViewController, CanInteractWithPresenter {
    
    /// Outlet for imageView.
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var informationContainerView: UIView!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var weightLabel: UILabel!
    
    var userInitiatedDate: Date!
    
    var didSendDisplayNotification: Bool = false
    
    var finishedDisplayRenderDate: Date!
    
    /// Associated presenter.
    var presenter: DetailedViewerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = presenter.fruitViewModel.fruitName
        
        if let fruitImage = presenter.fruitViewModel.fruitImage {
            imageView.image = fruitImage
        }
        
        toggleinformationContainerView(presenter.shouldHideDetails)
        
        priceLabel.text = presenter.fruitViewModel.fruitPrice
        weightLabel.text = presenter.fruitViewModel.fruitWeight
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        finishedDisplayRenderDate = Date()
        
        guard didSendDisplayNotification else {
            didSendDisplayNotification = true
            return
        }
    }
    
    func toggleinformationContainerView(_ isHidden: Bool) {
        informationContainerView.isHidden = isHidden
    }

}

extension DetailedViewerViewController: SupportDisaplyUsageStatsUpdate {
    
}

extension DetailedViewerViewController {
    
    /// Storyboard name
    enum Storyboard: String {
        case name = "DetailedViewer"
    }
    
}
