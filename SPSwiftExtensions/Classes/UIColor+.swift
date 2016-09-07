//
//  UIColor+.swift
//  SwiftExtensions
//
//  Created by guys from actonica on 15/01/16.
//  Copyright © 2016 Actonica studio. All rights reserved.
//

import UIKit

public extension UIColor {
	convenience init(rgbaColorCode:Int) {
		let r = ((CGFloat)((rgbaColorCode & 0xff0000) >> 24)) / 255.0;
		let g = ((CGFloat)((rgbaColorCode & 0xff0000) >> 16)) / 255.0;
		let b = ((CGFloat)((rgbaColorCode & 0xff00) >> 8)) / 255.0;
		let a = ((CGFloat)(rgbaColorCode & 0xff)) / 255.0;
		self.init(red: r, green: g, blue: b, alpha: a);
	}
	
	convenience init(rgbColorCode:Int) {
		let r = ((CGFloat)((rgbColorCode & 0xff0000) >> 16)) / 255.0;
		let g = ((CGFloat)((rgbColorCode & 0xff00) >> 8)) / 255.0;
		let b = ((CGFloat)(rgbColorCode & 0xff)) / 255.0;
		self.init(red: r, green: g, blue: b, alpha: 1);
	}
}
