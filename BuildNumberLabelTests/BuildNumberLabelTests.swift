//
//  BuildNumberLabelTests.swift
//  BuildNumberLabelTests
//
//  Created by David Sweetman on 1/22/16.
//  Copyright © 2016 smashingboxes. All rights reserved.
//

import XCTest
@testable import BuildNumberLabel

class BuildNumberLabelTests: XCTestCase {
    
    var testBundle: Bundle {
        let bundleId = "com.smashingboxes.BuildNumberLabelTests"
        return Bundle.allBundles.first(where: { $0.bundleIdentifier == bundleId })!
    }
    
    func testVersionNumberInString() {
        let version = testBundle.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        let label = BuildNumberLabel.create(bundle: testBundle)
        XCTAssertTrue(label.text!.contains("\(version!)"))
    }
    
    func testBuildNumberInString() {
        let build = testBundle.object(forInfoDictionaryKey: String(kCFBundleVersionKey))
        let label = BuildNumberLabel.create(bundle: testBundle)
        XCTAssertTrue(label.text!.contains("\(build!)"))
    }
    
    func testUsesFont() {
        let font = UIFont(name: "Avenir", size: 20.0)
        let label = BuildNumberLabel.create(font: font)
        XCTAssertTrue(label.font.fontName == font?.fontName)
        XCTAssertTrue(label.font.pointSize == font?.pointSize)
    }

    func testUsesColor() {
        let label = BuildNumberLabel.create(color: UIColor.red)
        XCTAssertTrue(label.textColor.isEqual(UIColor.red))
    }

}
