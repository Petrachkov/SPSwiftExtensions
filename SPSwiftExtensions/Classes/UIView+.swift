//
//  UIView+.swift
//  SwiftExtensions
//
//  Created by sergey petrachkov on 15/07/16.
//  Copyright © 2016 actonica. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	//Hi, Ray Wenderlich! :)
	//adds activity indicator to a view
	func lock() {
		if let _ = viewWithTag(10) {
			//View is already locked
		}
		else {
			let lockView = UIView(frame: bounds)
			lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
			lockView.tag = 10
			lockView.alpha = 0.0
			let activity = UIActivityIndicatorView(activityIndicatorStyle: .White)
			activity.hidesWhenStopped = true
			activity.center = lockView.center
			lockView.addSubview(activity)
			activity.startAnimating()
			addSubview(lockView)
			
			UIView.animateWithDuration(0.2) {
				lockView.alpha = 1.0
			}
		}
	}
	
	func unlock() {
		if let lockView = viewWithTag(10) {
			UIView.animateWithDuration(0.2, animations: {
				lockView.alpha = 0.0
			}) { finished in
				lockView.removeFromSuperview()
			}
		}
	}

	/**
	@brief adds blur effect to any view
	*/
	func addBlurEffect(toNavBar : Bool) {
		// Add blur view
		var bounds = self.bounds as CGRect!
		if(toNavBar){
			bounds.offsetInPlace(dx: 0.0, dy: -20.0)
			bounds.size.height = bounds.height + 20.0
		}
		let visualEffectView = UIView();
		visualEffectView.frame = bounds
		visualEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
		self.addSubview(visualEffectView)
		visualEffectView.layer.zPosition -= 5;
		if(toNavBar){
			visualEffectView.tag = 0;
		}
		self.sendSubviewToBack(visualEffectView);
	}
	
	func centerVertically(containerView view : UIView){
		self.frame = CGRectMake(self.frame.origin.x, (view.frame.height - self.frame.height) / 2, self.frame.width, self.frame.height);
	}
	
	func centerHorizontally(containerView view : UIView){
		self.frame = CGRectMake((view.frame.width - self.frame.width) / 2,self.frame.origin.y, self.frame.width, self.frame.height);
	}
	
	func centerVertically(anchorView view : UIView){
		self.frame.origin.y = (view.frame.minY) + ((view.frame.height / 2) -  (self.frame.height / 2));
	}
	
	func setWidth(width : CGFloat){
		self.frame.size.width = width;
	}
	
	/**
	@brief It moves view horizontally by given delta
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param delta The value one wants to move the view
	*/
	func moveHorizontallyBy (delta: CGFloat){
		self.frame = CGRectMake(self.frame.origin.x + delta, self.frame.origin.y, self.frame.width, self.frame.height);
	}
	/**
	@brief It moves view left by given delta
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param left The value one wants to move the view
	*/
	func moveLeftBy(left : CGFloat){
		self.moveHorizontallyBy(-left);
	}
	/**
	@brief It moves view right by given delta
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param right The value one wants to move the view
	*/
	func moveRightBy(right: CGFloat){
		self.moveHorizontallyBy(right);
	}
	/**
	@brief It moves view to vertically by given delta
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param delta The value one wants to move the view
	*/
	func moveVerticallyBy(delta : CGFloat){
		self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + delta, self.frame.width, self.frame.height);
	}
	/**
	@brief It moves view up by given delta
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param up The value one wants to move the view
	*/
	func moveUpBy(up : CGFloat){
		self.moveVerticallyBy(-up);
	}
	/**
	@brief It moves view down by given delta
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param down The value one wants to move the view
	*/
	func moveDownBy(down : CGFloat){
		self.moveVerticallyBy(down);
	}
	
	/**
	@brief It sets top (origin.y) of the vuew by given value
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param top The value one wants view to origin from vertically
	*/
	func setTop (top : CGFloat){
		self.frame = CGRectMake(self.frame.origin.x, top, self.frame.width, self.frame.height);
	}
	/**
	@brief It places view below another
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param delta anotherView.bottom + delta
	*/
	func placeDownAfter(view : UIView, delta : CGFloat){
		self.setTop(view.frame.maxY + delta);
	}
	/**
	@brief It places view to the rigt of another view
 
	@discussion This method accepts a CGFloat value representing the delta
 
	@param delta anotherView.frame.right + delta
	*/
	func placeRightAfter(view : UIView, delta : CGFloat){
		self.moveRightBy(view.frame.maxX + delta);
	}
	
	/// The color of the layer’s border. Animatable.
	@IBInspectable var borderColor : UIColor? {
		get {
			return UIColor.init(CGColor: self.layer.borderColor!);
		}
		set {
			self.layer.borderColor = newValue?.CGColor;
		}
	}
	
	/// The width of the layer’s border. Animatable.
	@IBInspectable var borderWidth : CGFloat {
		get {
			return self.layer.borderWidth;
		}
		set {
			self.layer.borderWidth = newValue;
		}
	}
	
	/// The radius to use when drawing rounded corners for the layer’s background. Animatable.
	@IBInspectable var cornerRadius : CGFloat {
		get {
			return self.layer.cornerRadius;
		}
		set {
			self.layer.cornerRadius = newValue;
		}
	}
	
	/// A Boolean indicating whether sublayers are clipped to the layer’s bounds. Animatable.
	@IBInspectable var masksLayerToBounds : Bool {
		get {
			return self.layer.masksToBounds;
		}
		set {
			self.layer.masksToBounds = newValue;
		}
	}
	
	/// The color of the layer’s shadow. Animatable.
	@IBInspectable var shadowColor : UIColor? {
		get {
			return UIColor(CGColor: self.layer.shadowColor!);
		}
		set {
			self.layer.shadowColor = newValue!.CGColor;
		}
	}
	
	/// The offset (in points) of the layer’s shadow. Animatable.
	@IBInspectable var shadowOffset : CGPoint {
		get {
			return CGPoint(x: self.layer.shadowOffset.width,
			               y: self.layer.shadowOffset.height);
		}
		set {
			self.layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y);
		}
	}
	
	/// The opacity of the layer’s shadow. Animatable.
	@IBInspectable var shadowOpacity : Float {
		get {
			return self.layer.shadowOpacity;
		}
		set {
			self.layer.shadowOpacity = newValue;
		}
	}
	
	/// The blur radius (in points) used to render the layer’s shadow. Animatable.
	@IBInspectable var shadowRadius : CGFloat {
		get {
			return self.layer.shadowRadius;
		}
		set {
			self.layer.shadowRadius = newValue;
		}
	}
	
	/// A Boolean that indicates whether the layer is rendered as a bitmap before compositing. Animatable.
	@IBInspectable var shouldRasterize: Bool {
		get {
			return self.layer.shouldRasterize;
		}
		set {
			self.layer.shouldRasterize = newValue;
		}
	}
	
	//MARK: - Extension methods
	
	func pinWithConstraint (viewToPinTo: UIView,
	                        attribute: NSLayoutAttribute,
	                        constant: CGFloat = 0.0,
	                        multiplier: CGFloat = 1.0,
	                        layoutRelation: NSLayoutRelation = NSLayoutRelation.Equal,
	                        priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint? {
		
		var selfAttribute : NSLayoutAttribute;
		selfAttribute = NSLayoutAttribute.NotAnAttribute;
		
		if (attribute == .Left || attribute == .LeftMargin) {
			selfAttribute = .Left;
		} else if (attribute == .Top || attribute == .TopMargin) {
			selfAttribute = .Top;
		} else if (attribute == .Right || attribute == .RightMargin) {
			selfAttribute = .Right;
		} else if (attribute == .Bottom || attribute == .BottomMargin) {
			selfAttribute = .Bottom;
		} else if (attribute == .CenterX || attribute == .CenterXWithinMargins) {
			selfAttribute = .CenterX;
		} else if (attribute == .CenterY || attribute == .CenterYWithinMargins) {
			selfAttribute = .CenterY;
		} else {
			return nil;
		}
		
		let constraint = NSLayoutConstraint.init(item: self,
		                                         attribute: selfAttribute,
		                                         relatedBy: layoutRelation,
		                                         toItem: viewToPinTo,
		                                         attribute: attribute,
		                                         multiplier: 1.0,
		                                         constant: constant);
		constraint.priority = priority;
		viewToPinTo.addConstraint(constraint);
		return constraint;
	}
	
	func pinWithZeroInsets (viewToPinTo: UIView) -> [NSLayoutConstraint] {
		return pinWithInsets(viewToPinTo, insets: UIEdgeInsets());
	}
	
	func pinWithInsets (viewToPinTo: UIView, insets: UIEdgeInsets) -> [NSLayoutConstraint] {
		var constraints = [NSLayoutConstraint]();
		let leftConstraint = pinWithConstraint(viewToPinTo,
		                                       attribute: NSLayoutAttribute.Left,
		                                       constant: insets.left);
		if (leftConstraint != nil) {
			constraints.append(leftConstraint!);
			viewToPinTo.addConstraint(leftConstraint!);
		}
		let topConstraint = pinWithConstraint(viewToPinTo,
		                                      attribute: NSLayoutAttribute.Top,
		                                      constant: insets.top);
		if (topConstraint != nil) {
			constraints.append(topConstraint!);
			viewToPinTo.addConstraint(topConstraint!);
		}
		let rightConstraint = pinWithConstraint(viewToPinTo,
		                                        attribute: NSLayoutAttribute.Right,
		                                        constant: insets.right);
		if (rightConstraint != nil) {
			constraints.append(rightConstraint!);
			viewToPinTo.addConstraint(rightConstraint!);
		}
		let bottomConstraint = pinWithConstraint(viewToPinTo,
		                                         attribute: NSLayoutAttribute.Bottom,
		                                         constant: insets.bottom);
		if (bottomConstraint != nil) {
			constraints.append(bottomConstraint!);
			viewToPinTo.addConstraint(bottomConstraint!);
		}
		return constraints;
	}
	
	func addCurrentHeightConstraint() -> NSLayoutConstraint? {
		return addHeightConstraint(self.bounds.height);
	}
	
	func addHeightConstraint(height: CGFloat) -> NSLayoutConstraint? {
		return NSLayoutConstraint(item: self,
		                          attribute: NSLayoutAttribute.Height,
		                          relatedBy: NSLayoutRelation.Equal,
		                          toItem: nil,
		                          attribute: NSLayoutAttribute.NotAnAttribute,
		                          multiplier: 1.0,
		                          constant: height);
	}
	
	func addCurrentWidthConstraint() -> NSLayoutConstraint? {
		return addWidthConstraint(self.bounds.width);
	}
	
	func addWidthConstraint(width: CGFloat) -> NSLayoutConstraint? {
		return NSLayoutConstraint(item: self,
		                          attribute: NSLayoutAttribute.Width,
		                          relatedBy: NSLayoutRelation.Equal,
		                          toItem: nil,
		                          attribute: NSLayoutAttribute.NotAnAttribute,
		                          multiplier: 1.0,
		                          constant: width);
	}
	
	func addCurrentSizeConstraints() -> [NSLayoutConstraint] {
		return addSizeConstraints(self.bounds.size);
	}
	
	func addSizeConstraints(size: CGSize) -> [NSLayoutConstraint] {
		var constraints = [NSLayoutConstraint]();
		let widthConstraint = addWidthConstraint(size.width);
		if (widthConstraint != nil) {
			constraints.append(widthConstraint!);
			self.addConstraint(widthConstraint!);
		}
		let heightConstraint = addHeightConstraint(size.height);
		if (heightConstraint != nil) {
			constraints.append(heightConstraint!);
			self.addConstraint(heightConstraint!);
		}
		return constraints;
	}
	
	func addSizeConstraints(width: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
		return addSizeConstraints(CGSize(width: width, height: height));
	}
	
	func addAspectConstraint(x: CGFloat, y: CGFloat) -> NSLayoutConstraint {
		let constraint = NSLayoutConstraint(item: self,
		                                    attribute: .Width,
		                                    relatedBy: .Equal,
		                                    toItem: self,
		                                    attribute: .Height,
		                                    multiplier: x / y,
		                                    constant: 0.0);
		self.addConstraint(constraint);
		return constraint;
	}
	
	func addSpacingConstraint(otherView: UIView, spacingToAttribute: NSLayoutAttribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0) -> NSLayoutConstraint? {
		var selfAttribute = NSLayoutAttribute.NotAnAttribute;
		
		if (spacingToAttribute == NSLayoutAttribute.Left) {
			selfAttribute = NSLayoutAttribute.Right;
		} else if (spacingToAttribute == NSLayoutAttribute.Top) {
			selfAttribute = NSLayoutAttribute.Bottom;
		} else if (spacingToAttribute == NSLayoutAttribute.Right) {
			selfAttribute = NSLayoutAttribute.Left;
		} else if (spacingToAttribute == NSLayoutAttribute.Bottom) {
			selfAttribute = NSLayoutAttribute.Top;
		} else {
			return nil;
		}
		
		let constraint = NSLayoutConstraint(item: otherView,
		                                    attribute: spacingToAttribute,
		                                    relatedBy: NSLayoutRelation.Equal,
		                                    toItem: self,
		                                    attribute: selfAttribute,
		                                    multiplier: multiplier,
		                                    constant: constant);
		otherView.superview!.addConstraint(constraint);
		return constraint;
	}
}
