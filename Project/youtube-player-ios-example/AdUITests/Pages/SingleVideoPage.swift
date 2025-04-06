//
//  SingleVideoPage.swift
//  youtube-player-ios-example
//
//  Created by ly on 4/5/25.
//  Copyright © 2025 YouTube Developer Relations. All rights reserved.
//
import XCTest

final class SingleVideoPage{
    let app:XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    var singleVideoTab:XCUIElement{
        return app.tabBars.buttons["Single Video"]
    }
    var adBanner:XCUIElement{
        return app.otherElements["AdBanner"]
    }
    /*
    var skipButton:XCUIElement{
        return app.buttons["SkipButton"]
    }
    
    func waitforSkippableButtonToBeClick(timeout: TimeInterval = 8.0) -> Bool{
        let predicate = NSPredicate(format: "(label == [c]'skip') AND isHittable == true")
        let expecation = XCTNSPredicateExpectation(predicate: predicate, object: skipButton)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        return result == .completed
    }
    */
    func goToSingleVideoTab(){
        XCTAssertTrue(singleVideoTab.exists)
        singleVideoTab.tap()
    }
    
    func waitforAdBanner(timeout: TimeInterval = 5.0) -> Bool{
        return adBanner.waitForExistence(timeout: timeout)
    }
    
}
