//
//  ErrorViewTests.swift
//  FruitViewerTests

import XCTest
@testable import Kizen

class ErrorViewTests: XCTestCase {
    
    func testDidSelectRetryButton() {
        let errorView = ErrorView()
        
        let onRetryButtonSelect = expectation(description: " - onRetryButtonSelect")
        errorView.onRetryButtonSelect = {
            onRetryButtonSelect.fulfill()
        }
        
        errorView.didSelectRetryButton(UIButton(frame: .zero))
        
        waitForExpectations(timeout: 1)
    }
    
}
