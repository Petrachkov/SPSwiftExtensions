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
    func setCursorPosition(atRange : NSRange) {
        let start : UITextPosition = self.positionFromPosition(self.beginningOfDocument, offset: atRange.location)!
        let end : UITextPosition = self.positionFromPosition(start, offset: atRange.length)!
        self.selectedTextRange = self.textRangeFromPosition(start, toPosition: end)
    }
}
