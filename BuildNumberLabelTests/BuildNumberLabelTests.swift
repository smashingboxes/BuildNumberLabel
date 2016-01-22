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
    
    func testVersionNumberInString() {
        let version = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString")
        let label = BuildNumberLabel.create()
        XCTAssertTrue(label.text!.containsString("\(version)"))
    }
    
    func testBuildNumberInString() {
        let build = NSBundle.mainBundle().objectForInfoDictionaryKey(String(kCFBundleVersionKey))
        let label = BuildNumberLabel.create()
        XCTAssertTrue(label.text!.containsString("\(build)"))
    }
    
    func testUsesFont() {
        let font = UIFont(name: "Avenir", size: 20.0)
        let label = BuildNumberLabel.create(font: font)
        XCTAssertTrue(label.font.fontName == font?.fontName)
        XCTAssertTrue(label.font.pointSize == font?.pointSize)
    }

    func testUsesColor() {
        let label = BuildNumberLabel.create(color: UIColor.redColor())
        XCTAssertTrue(label.textColor.isEqual(UIColor.redColor()))
    }

}
