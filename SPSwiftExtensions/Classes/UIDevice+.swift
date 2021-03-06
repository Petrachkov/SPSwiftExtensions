//
//  UIDevice+.swift
//  SwiftExtensions
//
//  Created by actonica team, mostly Zerg Rush on 15/07/16.
//  Copyright © 2016 actonica. All rights reserved.
//

import Foundation
import UIKit
public enum ScreenType: String {
	/// iPhone 4 and 4s screen
	case iPhone4
	/// iPhone 5, 5C and 5S screen
	case iPhone5
	/// iPhone 6 and 6S screen size
	case iPhone6
	/// iPhone 6 and 6S screen size (zoomed mode)
	case iPhone6Zoomed
	/// iPhone 6 Plus and 6S Plus screen size
	case iPhone6Plus
	/// iPhone 6 Plus and 6S Plus screen size (zoomed mode)
	case iPhone6PlusZoomed
	/// Unrecognized screen size
	case unrecognized
}
public extension UIDevice {
	var iPhone: Bool {
		return UIDevice().userInterfaceIdiom == .phone
	}
	
	
	
	/// Device screen type
	var screenType: ScreenType {
		guard iPhone else { return ScreenType.unrecognized; }
		
		let mainScreen = UIScreen.main;
		
		let isIOS8OrLater = SYSTEM_VERSION_GREATER_THAN("8.0");
		let screenBoundsHeight = mainScreen.bounds.height;
		let screenNativeScale = mainScreen.nativeScale;
		let screenScale = mainScreen.scale;
		
		if (screenBoundsHeight == 568.0
			&& ((isIOS8OrLater && screenNativeScale == screenScale)
				|| !isIOS8OrLater)) {
			return ScreenType.iPhone5;
		} else if (screenBoundsHeight == 667.0
			&& isIOS8OrLater
			&& screenNativeScale == screenScale) {
			return ScreenType.iPhone6;
		} else if (screenBoundsHeight == 568.0
			&& isIOS8OrLater
			&& screenNativeScale > screenScale) {
			return ScreenType.iPhone6Zoomed;
		} else if (screenBoundsHeight == 736.0) {
			return ScreenType.iPhone6Plus;
		} else if (screenBoundsHeight == 667.0
			&& isIOS8OrLater
			&& screenNativeScale < screenScale) {
			return ScreenType.iPhone6PlusZoomed;
		}
		else {
			return ScreenType.iPhone4;
		}
	}
	
	func SYSTEM_VERSION_EQUAL_TO(_ version: String) -> Bool {
		return UIDevice.current.systemVersion.compare(version,
		                                              options: NSString.CompareOptions.numeric) == ComparisonResult.orderedSame
	}
	
	func SYSTEM_VERSION_GREATER_THAN(_ version: String) -> Bool {
		return UIDevice.current.systemVersion.compare(version,
		                                              options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
	}
	
	func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(_ version: String) -> Bool {
		return UIDevice.current.systemVersion.compare(version,
		                                              options: NSString.CompareOptions.numeric) != ComparisonResult.orderedAscending
	}
	
	func SYSTEM_VERSION_LESS_THAN(_ version: String) -> Bool {
		return UIDevice.current.systemVersion.compare(version,
		                                              options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
	}
	
	func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(_ version: String) -> Bool {
		return UIDevice.current.systemVersion.compare(version,
		                                              options: NSString.CompareOptions.numeric) != ComparisonResult.orderedDescending
	}
}
