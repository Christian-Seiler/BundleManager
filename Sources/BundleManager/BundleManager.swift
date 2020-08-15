//
//  BundleManager.swift
//  BundleManager
//
//  Copyright © 2020 Christian Seiler. All rights reserved.
//

import Foundation

// swiftlint:disable discouraged_optional_boolean
/**
 BundleManager
 */
public class BundleManager {

    private let bundle: Bundle

    /// Creates a default BundleManager
    public static var `default` = BundleManager()

    ///
    public init(bundle: Bundle = Bundle.main) {
        self.bundle = bundle
    }

    // MARK: - Categorization

    /// The type of bundle.
    /// Name: Bundle OS Type code
    public var packageType: String? {
        bundle.infoDictionary?[BundleIds.CFBundlePackageType.rawValue] as? String
    }

    /// The category that best describes your app for the App Store.
    ///
    /// Name: Application Category
    public var applicationCategoryType: String? {
        bundle.infoDictionary?[BundleIds.LSApplicationCategoryType.rawValue] as? String
    }

    // MARK: - Identification
    /// A unique identifier for a bundle.
    ///
    /// Name: Bundle identifier
    public var bundleIdentifier: String {
        bundle.infoDictionary?[BundleIds.CFBundleIdentifier.rawValue] as? String ?? ""
    }

    /// The bundle ID of the watchOS app.
    public var watchBundleIdentifier: String? {
        bundle.infoDictionary?[BundleIds.WKAppBundleIdentifier.rawValue] as? String
    }

    #if os(iOS) || os(watchOS)
    /// The bundle ID of the watchOS app’s companion iOS app.
    public var companionBundleIdentifier: String? {
        bundle.infoDictionary?[BundleIds.WKCompanionAppBundleIdentifier.rawValue] as? String
    }
    #endif

    // MARK: - Naming
    /// A user-visible short name for the bundle.
    ///
    /// Name: Bundle name
    public var bundleName: String? {
        bundle.infoDictionary?[BundleIds.CFBundleName.rawValue] as? String
    }

    /// The user-visible name for the bundle, used by Siri and visible on the iOS Home screen.
    ///
    /// Name: Bundle display name
    public var displayName: String? {
        bundle.infoDictionary?[BundleIds.CFBundleDisplayName.rawValue] as? String
    }

    /// A replacement for the app name in text-to-speech operations.
    ///
    /// Name: Accessibility Bundle Name
    public var spokenName: String? {
        bundle.infoDictionary?[BundleIds.CFBundleSpokenName.rawValue] as? String
    }

    // MARK: - Bundle Version
    /// The version of the build that identifies an iteration of the bundle.
    ///
    /// Name: Bundle version
    /// Example: 1.0.0
    public var version: String? {
        bundle.infoDictionary?[BundleIds.CFBundleVersion.rawValue] as? String
    }
    /// The release or version number of the bundle.
    ///
    /// Name: Bundle versions string, short
    public var shortVersionString: String? {
        bundle.infoDictionary?[BundleIds.CFBundleShortVersionString.rawValue] as? String
    }
    /// The current version of the Information Property List structure.
    ///
    /// Name: InfoDictionary version
    public var infoDictionaryVersion: String? {
        bundle.infoDictionary?[BundleIds.CFBundleInfoDictionaryVersion.rawValue] as? String
    }
    /// A human-readable copyright notice for the bundle.
    /// Name: Copyright (human-readable)
    public var humanReadableCopyright: String? {
        bundle.infoDictionary?[BundleIds.NSHumanReadableCopyright.rawValue] as? String
    }

    // MARK: - Operating System Version
    /// The minimum operating system version required for the app to run.
    ///
    /// Name: Minimum system version
    public var minimumSystemVersion: String? {
        bundle.infoDictionary?[BundleIds.LSMinimumSystemVersion.rawValue] as? String
    }

    #if os(macOS)
    /// The minimum version of macOS required for the app to run on a set of architectures.
    /// Name: Minimum system versions, per-architecture
    public var minimumSystemVersionByArchitecture: String? {
        bundle.infoDictionary?[BundleIds.LSMinimumSystemVersionByArchitecture.rawValue] as? String
    }
    #endif

    #if os(iOS) || os(tvOS) || os(watchOS)
    /// The minimum operating system version required for the app to run on iOS, tvOS, and watchOS.
    public var minimumOSVersion: String? {
        bundle.infoDictionary?[BundleIds.MinimumOSVersion.rawValue] as? String
    }
    #endif

    /// A Boolean value indicating whether the app must run in iOS.
    ///
    /// Name: Application requires iPhone environment
    public var requiresIPhoneOS: Bool? {
        bundle.infoDictionary?[BundleIds.LSRequiresIPhoneOS.rawValue] as? Bool
    }
    /// A Boolean value that indicates whether the bundle is a watchOS app.
    public var watchKitApp: Bool? {
        bundle.infoDictionary?[BundleIds.WKWatchKitApp.rawValue] as? Bool
    }

    // MARK: - Localization
    /// The default language and region for the bundle, as a language ID.
    ///
    /// Name: Localization native development region
    public var developmentRegion: String? {
        bundle.infoDictionary?[BundleIds.CFBundleDevelopmentRegion.rawValue] as? String
    }

    /// The localizations handled manually by your app.
    ///
    /// Name: Localizations
    public var localizations: String? {
        bundle.infoDictionary?[BundleIds.CFBundleLocalizations.rawValue] as? String
    }

    /// A Boolean value that indicates whether the bundle supports the retrieval of localized strings from frameworks.
    ///
    /// Name: Localized resources can be mixed
    public var allowMixedLocalizations: Bool? {
        bundle.infoDictionary?[BundleIds.CFBundleAllowMixedLocalizations.rawValue] as? Bool
    }

    /// A Boolean value that enables the Caps Lock key to switch between Latin and non-Latin input sources.
    public var capsLockLanguageSwitchCapable: Bool? {
        bundle.infoDictionary?[BundleIds.TICapsLockLanguageSwitchCapable.rawValue] as? Bool
    }

    // MARK: - Help
    /// The name of the bundle’s HTML help file.
    ///
    /// Name: Help file
    public var appleHelpAnchor: String? {
        bundle.infoDictionary?[BundleIds.CFAppleHelpAnchor.rawValue] as? String
    }

    /// The name of the help file that will be opened in Help Viewer.
    ///
    /// Name: Help Book identifier
    public var helpBookName: String? {
        bundle.infoDictionary?[BundleIds.CFBundleHelpBookName.rawValue] as? String
    }

    /// The name of the folder containing the bundle’s help files.
    /// Name: Help Book directory name
    public var helpBookFolder: String? {
        bundle.infoDictionary?[BundleIds.CFBundleHelpBookFolder.rawValue] as? String
    }

    // swiftlint:disable identifier_name
    // swiftlint:disable explicit_enum_raw_value
    private enum BundleIds: String {
        // MARK: Categorization
        /// The type of bundle.
        /// Name: Bundle OS Type code
        case CFBundlePackageType
        /// The category that best describes your app for the App Store.
        /// Name: Application Category
        case LSApplicationCategoryType

        // MARK: Identification
        /// A unique identifier for a bundle.
        /// Required.
        /// Name: Bundle identifier
        case CFBundleIdentifier
        /// The bundle ID of the watchOS app.
        case WKAppBundleIdentifier
        /// The bundle ID of the watchOS app’s companion iOS app.
        case WKCompanionAppBundleIdentifier

        // MARK: Naming
        /// A user-visible short name for the bundle.
        /// Name: Bundle name
        case CFBundleName
        /// The user-visible name for the bundle, used by Siri and visible on the iOS Home screen.
        /// Name: Bundle display name
        case CFBundleDisplayName
        /// A replacement for the app name in text-to-speech operations.
        /// Name: Accessibility Bundle Name
        case CFBundleSpokenName

        // MARK: Bundle Version
        /// The version of the build that identifies an iteration of the bundle.
        /// Name: Bundle version
        case CFBundleVersion
        /// The release or version number of the bundle.
        /// Name: Bundle versions string, short
        case CFBundleShortVersionString
        /// The current version of the Information Property List structure.
        /// Name: InfoDictionary version
        case CFBundleInfoDictionaryVersion
        /// A human-readable copyright notice for the bundle.
        /// Name: Copyright (human-readable)
        case NSHumanReadableCopyright

        // MARK: Operating System Version
        /// The minimum operating system version required for the app to run.
        /// Name: Minimum system version
        case LSMinimumSystemVersion
        /// The minimum version of macOS required for the app to run on a set of architectures.
        /// Name: Minimum system versions, per-architecture
        case LSMinimumSystemVersionByArchitecture
        /// The minimum operating system version required for the app to run on iOS, tvOS, and watchOS.
        case MinimumOSVersion
        /// A Boolean value indicating whether the app must run in iOS.
        /// Name: Application requires iPhone environment
        case LSRequiresIPhoneOS
        /// A Boolean value that indicates whether the bundle is a watchOS app.
        case WKWatchKitApp

        // MARK: Localization
        /// The default language and region for the bundle, as a language ID.
        /// Name: Localization native development region
        case CFBundleDevelopmentRegion
        /// The localizations handled manually by your app.
        /// Name: Localizations
        case CFBundleLocalizations
        /// A Boolean value that indicates whether the bundle supports the retrieval of localized strings from frameworks.
        /// Name: Localized resources can be mixed
        case CFBundleAllowMixedLocalizations
        /// A Boolean value that enables the Caps Lock key to switch between Latin and non-Latin input sources.
        case TICapsLockLanguageSwitchCapable
        // MARK: Help
        /// The name of the bundle’s HTML help file.
        /// Name: Help file
        case CFAppleHelpAnchor
        /// The name of the help file that will be opened in Help Viewer.
        /// Name: Help Book identifier
        case CFBundleHelpBookName
        /// The name of the folder containing the bundle’s help files.
        /// Name: Help Book directory name
        case CFBundleHelpBookFolder
        // swiftlint:enable identifier_name
    }

}
