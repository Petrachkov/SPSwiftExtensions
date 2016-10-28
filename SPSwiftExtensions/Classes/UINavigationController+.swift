//
//  UINavigationController+Extensions.swift
//  SwiftExtensions
//
//  Created by Zerg Rush from actonica studio on 19.04.16.
//  Copyright © 2016 Actonica studio. All rights reserved.
//

import UIKit

public extension UINavigationController {
	func pushViewControllerMoveInFromDown(_ viewController: UIViewController) {
		let transition = CATransition();
		transition.duration = 0.3;
		transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut);
		transition.type = kCATransitionPush;
		transition.subtype = kCATransitionFromTop;
		self.view.layer.add(transition, forKey: nil);
		self.pushViewController(viewController, animated: false);
	}
}
