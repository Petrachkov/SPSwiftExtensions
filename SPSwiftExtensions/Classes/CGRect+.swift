//
//  CoreGraphicsUtils.swift
//  SwiftExtensions
//
//  Created by Zerg Rush on 08.04.16.
//  Copyright © 2016 Actonica team. All rights reserved.
//

import UIKit

extension CGRect {
	//Returns a point representing the rect center.
	var center: CGPoint {
		return CGPoint(x: self.midX, y: self.midY);
	}
	
	//Returns a distance from this rect center to the specified rect center.
	func getDistanceCentersDistance(otherRect: CGRect) -> CGFloat {
		return CGFloat(sqrt(pow(otherRect.midX - self.midX, 2.0)
			+ pow(otherRect.midY - self.midY, 2.0)));
	}
}
