//
//  FunctionsTests.swift
//  FruitViewerTests

import XCTest
@testable import Kizen

class FunctionsTests: XCTestCase {
    
    func testAppleClassesDoNotHaveAModulePrefix() {
        let className = classNameFromType(NSString.self)
        
        XCTAssertEqual(className, "NSString")
    }
    
    func testSkySportsClassesDoHaveAModulePrefix() {
        let className = classNameFromType(Kizen.AppDelegate.self)
        
        XCTAssertEqual(className, "AppDelegate")
    }
    
}
