//
//  String+.swift
//  SwiftExtensions
//
//  Created by guys from Actonica studio on 25.05.16.
//  Copyright © 2016 Actonica studio. All rights reserved.
//

import UIKit


extension String {
	var localized : String {
		return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
	}
	
	func isEqualToStringCaseInsensitive(str2 : String) -> Bool {
		let obj1 = self.uppercaseString
		let obj2 = str2.uppercaseString
		let result = obj1 == obj2
		return result
	}
	
	func contains(substr : String) -> Bool {
		if let _ = self.rangeOfString(substr) {
			return true
		}
		return false
	}
	
	func containsCaseInsensitive(substr : String) -> Bool {
		let str1 = self.uppercaseString
		let str2 = substr.uppercaseString
		let resut = str1.contains(str2)
		return resut
	}
	
	static func stringByIgnoreEmptyOrNil(str : String?) -> String {
		let result : String = str ?? ""
		return result
	}
	
	subscript (i: Int) -> Character {
		return self[self.startIndex.advancedBy(i)]
	}
	
	subscript (i: Int) -> String {
		return String(self[i] as Character)
	}
	
	subscript (r: Range<Int>) -> String {
		let start = startIndex.advancedBy(r.startIndex)
		let end = start.advancedBy(r.endIndex - r.startIndex)
		//return self[Range(start: start, end: end)]
		return self[start..<end];
	}
	
	func convertToDate(format : String) -> NSDate {
		let formatter = NSDateFormatter()
		formatter.dateFormat = format
		let result = formatter.dateFromString(self)
		return result!
	}
}
