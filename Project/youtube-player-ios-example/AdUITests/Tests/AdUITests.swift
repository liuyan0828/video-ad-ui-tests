//
//  AdUITests.swift
//  youtube-player-ios-example
//
//  Created by ly on 4/5/25.
//  Copyright © 2025 YouTube Developer Relations. All rights reserved.
//
import XCTest

final class AdUITests:XCTestCase{
    var app: XCUIApplication!
    var singleVideoPage: SingleVideoPage!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        singleVideoPage = SingleVideoPage(app:app)
    }
    /*
    addUIInterruptionMonitor(withDescription: "系统权限弹窗") { alert in
            if alert.buttons["允许"].exists {
                alert.buttons["允许"].tap()
                return true
            }
            return false
        }
        
        app.launch()
        app.tap() // ⚠️ 触发 interruption monitor
        
        singleVideoPage = SingleVideoPage(app:app)
    }
    
    override func tearDownWithError() throws {
        app = nil
        singleVideoPage = nil
    }
   */
    @MainActor
    func testAdBannerAppears() throws{
        singleVideoPage.goToSingleVideoTab()
        XCTAssertTrue(singleVideoPage.waitforAdBanner(), "Ad banner did not appear in time")
    }
    
    @MainActor
    func testLaunchPerformance() throws{
        if #available(iOS 13.0, *){
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
            self.executionTimeAllowance = 5.0
        }
    }
}
