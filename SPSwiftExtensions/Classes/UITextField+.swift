//
//  UITextField+.swift
//  SwiftExtensions
//
//  Created by Viktor Antonov on 15/01/16.
//  Copyright © 2016 Viktor Antonov. All rights reserved.
//

import UIKit
import ObjectiveC
import Foundation
import QuartzCore

public extension UITextField {
	func setCursorPosition(_ atRange : NSRange) {
		let start : UITextPosition = self.position(from: self.beginningOfDocument, offset: atRange.location)!
		let end : UITextPosition = self.position(from: start, offset: atRange.length)!
		self.selectedTextRange = self.textRange(from: start, to: end)
	}
}
