//
//  BundleManagerTests.swift
//  BundleManager
//
//  Copyright © 2020 Christian Seiler. All rights reserved.
//

import XCTest
@testable import BundleManager

// swiftlint:disable explicit_acl
final class BundleManagerTests: XCTestCase {

    // MARK: - Categorization
    func testpackageType() {
        if let type = BundleManager(bundle: TestBundle()).packageType {
            XCTAssertEqual(type, "TEST")
        } else {
            XCTFail()
        }
    }
    func testapplicationCategoryType() {
        if let type = BundleManager(bundle: TestBundle()).applicationCategoryType {
            XCTAssertEqual(type, "TESTBUNDLE")
        } else {
            XCTFail()
        }
    }

    // MARK: - Identification
    func testbundleIdentifier() {
        XCTAssertEqual(BundleManager(bundle: TestBundle()).bundleIdentifier, "ch.christianseiler.bundle.test")
    }

    func testwatchBundleIdentifier() {
        if let identifier = BundleManager(bundle: TestBundle()).watchBundleIdentifier {
            XCTAssertEqual(identifier, "ch.christianseiler.wkbundle.test")
        } else {
            XCTFail()
        }
    }

    #if os(iOS) || os(watchOS)
    func testcompanionBundleIdentifier() {
        if let identifier = BundleManager(bundle: TestBundle()).companionBundleIdentifier {
            XCTAssertEqual(identifier, "ch.christianseiler.wkbundle.companion.test")
        } else {
            XCTFail()
        }
    }
    #endif

    // MARK: - Naming
    func testbundleName() {
        if let name = BundleManager(bundle: TestBundle()).bundleName {
            XCTAssertEqual(name, "XCTestBundle")
        } else {
            XCTFail()
        }
    }
    func testdisplayName() {
        if let name = BundleManager(bundle: TestBundle()).displayName {
            XCTAssertEqual(name, "TestBundle")
        } else {
            XCTFail()
        }
    }
    func testspokenName() {
        if let name = BundleManager(bundle: TestBundle()).spokenName {
            XCTAssertEqual(name, "Test Bundle")
        } else {
            XCTFail()
        }
    }

    // MARK: - Bundle Version
    func testversion() {
        if let version = BundleManager(bundle: TestBundle()).version {
            XCTAssertEqual(version, "1")
        } else {
            XCTFail()
        }
    }
    func testshortVersionString() {
        if let version = BundleManager(bundle: TestBundle()).shortVersionString {
            XCTAssertEqual(version, "1.2.3")
        } else {
            XCTFail()
        }
    }
    func testinfoDictionaryVersion() {
        if let version = BundleManager(bundle: TestBundle()).infoDictionaryVersion {
            XCTAssertEqual(version, "6")
        } else {
            XCTFail()
        }
    }
    func testhumanReadableCopyright() {
        if let copyright = BundleManager(bundle: TestBundle()).humanReadableCopyright {
            XCTAssertEqual(copyright, "Copyright 2020 Christian Seiler Services")
        } else {
            XCTFail()
        }
    }

    // MARK: - Operating System Version
    func testminimumSystemVersion() {
        if let version = BundleManager(bundle: TestBundle()).minimumSystemVersion {
            XCTAssertEqual(version, "10")
        } else {
            XCTFail()
        }
    }

    #if os(macOS)
    func testminimumSystemVersionByArchitecture() {
        if let version = BundleManager(bundle: TestBundle()).minimumSystemVersionByArchitecture {
            XCTAssertEqual(version, "11")
        } else {
            XCTFail()
        }
    }
    #endif

    #if os(iOS) || os(tvOS) || os(watchOS)
    func testminimumOSVersion() {
        if let version = BundleManager(bundle: TestBundle()).minimumOSVersion {
            XCTAssertEqual(version, "12")
        } else {
            XCTFail()
        }
    }
    #endif

    func testrequiresIPhoneOS() {
        if let requiresIPhoneOS = BundleManager(bundle: TestBundle()).requiresIPhoneOS {
            XCTAssertTrue(requiresIPhoneOS)
        } else {
            XCTFail()
        }
    }

    func testwatchKitApp() {
        if let watchKitApp = BundleManager(bundle: TestBundle()).watchKitApp {
            XCTAssertTrue(watchKitApp)
        } else {
            XCTFail()
        }
    }

    // MARK: - Localization
    func testdevelopmentRegion() {
        if let region = BundleManager(bundle: TestBundle()).developmentRegion {
            XCTAssertEqual(region, "en")
        } else {
            XCTFail()
        }
    }

    func testlocalizations() {
        if let localizations = BundleManager(bundle: TestBundle()).localizations {
            XCTAssertEqual(localizations, "en,de")
        } else {
            XCTFail()
        }
    }

    func testallowMixedLocalizations() {
        if let allowMixedLocalizations = BundleManager(bundle: TestBundle()).allowMixedLocalizations {
            XCTAssertTrue(allowMixedLocalizations)
        } else {
            XCTFail()
        }
    }

    func testcapsLockLanguageSwitchCapable() {
        if let capable = BundleManager(bundle: TestBundle()).capsLockLanguageSwitchCapable {
            XCTAssertTrue(capable)
        } else {
            XCTFail()
        }
    }

    // MARK: - Help
    func testappleHelpAnchor() {
        if let appleHelpAnchor = BundleManager(bundle: TestBundle()).appleHelpAnchor {
            XCTAssertEqual(appleHelpAnchor, "Help_Anchor")
        } else {
            XCTFail()
        }
    }
    func testhelpBookName() {
        if let name = BundleManager(bundle: TestBundle()).helpBookName {
            XCTAssertEqual(name, "HelpBook")
        } else {
            XCTFail()
        }
    }
    func testhelpBookFolder() {
        if let folder = BundleManager(bundle: TestBundle()).helpBookFolder {
            XCTAssertEqual(folder, "./help")
        } else {
            XCTFail()
        }
    }

    //    static var allTests = [
    //        ("testExample", testExample),
    //    ]
}

// swiftlint:disable all
private class TestBundle: Bundle {
    override var infoDictionary: [String: Any]? {
        [
            // MARK: Categorization
            "CFBundlePackageType": "TEST",
            "LSApplicationCategoryType": "TESTBUNDLE",

            // MARK: Identification
            "CFBundleIdentifier": "ch.christianseiler.bundle.test",
            "WKAppBundleIdentifier": "ch.christianseiler.wkbundle.test",
            "WKCompanionAppBundleIdentifier": "ch.christianseiler.wkbundle.companion.test",

            // MARK: Naming
            "CFBundleName": "XCTestBundle",
            "CFBundleDisplayName": "TestBundle",
            "CFBundleSpokenName": "Test Bundle",

            // MARK: Bundle Version
            "CFBundleVersion": "1",
            "CFBundleShortVersionString": "1.2.3",
            "CFBundleInfoDictionaryVersion": "6",
            "NSHumanReadableCopyright": "Copyright 2020 Christian Seiler Services",

            // MARK: Operating System Version
            "LSMinimumSystemVersion": "10",
            "LSMinimumSystemVersionByArchitecture": "11",
            "MinimumOSVersion": "12",
            "LSRequiresIPhoneOS": true,
            "WKWatchKitApp": true,

            // MARK: Localization
            "CFBundleDevelopmentRegion": "en",
            "CFBundleLocalizations": "en,de",
            "CFBundleAllowMixedLocalizations": true,
            "TICapsLockLanguageSwitchCapable": true,

            // MARK: Help
            "CFAppleHelpAnchor": "Help_Anchor",
            "CFBundleHelpBookName": "HelpBook",
            "CFBundleHelpBookFolder": "./help"
        ]
    }
}
// swiftlint:enable
