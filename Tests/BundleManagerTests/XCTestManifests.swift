//
//  XCTestManifests.swift
//  BundleManager
//
//  Copyright © 2020 Christian Seiler. All rights reserved.
//

import XCTest

// swiftlint:disable missing_docs
#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [
        testCase(BundleManagerTests.allTests)
    ]
}
#endif
