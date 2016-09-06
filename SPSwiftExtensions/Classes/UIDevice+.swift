//
//  UIDevice+.swift
//  SwiftExtensions
//
//  Created by actonica team, mostly Zerg Rush on 15/07/16.
//  Copyright © 2016 actonica. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
	var iPhone: Bool {
		return UIDevice().userInterfaceIdiom == .Phone
	}
	
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
	
	/// Device screen type
	var screenType: ScreenType {
		guard iPhone else { return ScreenType.unrecognized; }
		
		let mainScreen = UIScreen.mainScreen();
		
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
	
	func SYSTEM_VERSION_EQUAL_TO(version: String) -> Bool {
		return UIDevice.currentDevice().systemVersion.compare(version,
		                                                      options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedSame
	}
	
	func SYSTEM_VERSION_GREATER_THAN(version: String) -> Bool {
		return UIDevice.currentDevice().systemVersion.compare(version,
		                                                      options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedDescending
	}
	
	func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
		return UIDevice.currentDevice().systemVersion.compare(version,
		                                                      options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending
	}
	
	func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
		return UIDevice.currentDevice().systemVersion.compare(version,
		                                                      options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
	}
	
	func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
		return UIDevice.currentDevice().systemVersion.compare(version,
		                                                      options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedDescending
	}
}