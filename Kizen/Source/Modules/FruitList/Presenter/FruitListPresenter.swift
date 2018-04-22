//
//  FruitListPresenter.swift
//  FruitViewer

import UIKit

/// Presenter, Responsible for initaliting network request. Acts as a mediator for view and iinteractor.
class FruitListPresenter: Presenter {
    
    /// Associated view controller.
    weak var viewController: FruitListViewController?
    
    /// Associated Interactor.
    var interactor: FruitListInteractor
    
    init(viewController: FruitListViewController, interactor: FruitListInteractor) {
        self.viewController = viewController
        self.interactor = interactor
    }
    
    var fruitViewModels: [FruitViewModel] = []

    /// Call this method to load any required data.
    func loadIfRequired() {
        
        presenterWillUpdateContent(self.viewController)

        interactor.fetchData { [weak self] result in
            
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success(let fruits):
                strongSelf.fruitViewModels = fruits.map {
                    return FruitViewModel(fruit: $0)
                }
                strongSelf.presenterDidUpdateContent(strongSelf.viewController)
            case .failure(let error):
                strongSelf.presenterDidFailWithError(strongSelf.viewController, error)
            }
        }

    }
    
    // Test Injection
    
    var presenterWillUpdateContent: ((PresenterDelegate?) -> Void) = { presenterDelegate in
        presenterDelegate?.presenterWillUpdateContent()
    }
    
    var presenterDidUpdateContent: ((PresenterDelegate?) -> Void) = { presenterDelegate in
        presenterDelegate?.presenterDidUpdateContent()
    }
    
    var presenterDidFailWithError: ((PresenterDelegate?, Error) -> Void) = { presenterDelegate, error in
        presenterDelegate?.presenterDidFail(withError: error)
    }
}
