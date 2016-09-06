//
//  UIImage+.swift
//  JustTaxi
//
//  Created by sergey petrachkov on 30/08/16.
//  Copyright © 2016 actonica. All rights reserved.
//

import Foundation

extension UIImage{
	/**
	@brief This method should merge two images if possible or return bottom image without changes or nil
 
	@discussion This method accepts two strings that represent names of images
 
	@param bottomImageName - main image that should be a basement of a new merged image
	
	@param topImageName - name of a top image
	
	@param topOffset - offset
	*/
	class func getMergedImage(bottomImageName: String, topImageName: String, topOffset : CGFloat = 3) -> UIImage? {
		let bottomImage = UIImage(named: bottomImageName)
		let topImage = UIImage(named: topImageName)
		if (bottomImage == nil) {
			return nil;
		}
		else if (topImage == nil) {
			return bottomImage;
		}
		let size = CGSize(width: bottomImage!.size.width, height: bottomImage!.size.height)
		UIGraphicsBeginImageContext(size)
		let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
		bottomImage!.drawInRect(areaSize)
		topImage!.drawInRect(CGRectMake((bottomImage!.size.width - topImage!.size.width) / 2, topOffset, topImage!.size.width, topImage!.size.height), blendMode: CGBlendMode.Normal, alpha: 0.8)
		let mergedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return mergedImage;
	}

	/**
	@brief This method should merge two images
 
	@discussion This method accepts two UIImage instances
 
	@param bottomImage - main image that should be a basement of a new merged image
	
	@param topImage - a top image
	
	@param topOffset - offset
	*/
	class func getMergedImage(bottomImage: UIImage, topImage: UIImage, topOffset : CGFloat = 3) -> UIImage? {
		var mergedImage : UIImage? = nil;
		let size = CGSize(width: bottomImage.size.width, height: bottomImage.size.height)
		UIGraphicsBeginImageContext(size)
		let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
		bottomImage.drawInRect(areaSize)
		topImage.drawInRect(CGRectMake((bottomImage.size.width - topImage.size.width) / 2, topOffset, topImage.size.width, topImage.size.height), blendMode: CGBlendMode.Normal, alpha: 0.8)
		mergedImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return mergedImage;
	}
	
	class func getMergedMarcoPin(bottomImage: UIImage, topImage: UIImage, topOffset : CGFloat = 3.5) -> UIImage? {
		let imageSize = bottomImage.size.width - topOffset*2;
		var mergedImage : UIImage? = nil;
		let size = CGSize(width: bottomImage.size.width, height: bottomImage.size.height)
		UIGraphicsBeginImageContext(size)
		let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
		bottomImage.drawInRect(areaSize)
		//TODO: figure out +0.5 magic number
		topImage.getRoundedImage(imageSize/2, imageSize: CGSizeMake(imageSize, imageSize)).drawInRect(CGRectMake(topOffset + 0.5, topOffset, imageSize, imageSize), blendMode: CGBlendMode.Normal, alpha: 1)
		mergedImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return mergedImage;
	}
	
	func getRoundedImage(cornerRadius: CGFloat, imageSize : CGSize) -> UIImage{
		// Get your image somehow
		var image = self;
		// Begin a new image that will be the new image with the rounded corners
		// (here with the size of an UIImageView)
		UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.mainScreen().scale);
		// Add a clip before drawing anything, in the shape of an rounded rect
		UIBezierPath(roundedRect: CGRect(origin: CGPointMake(0, 0), size: imageSize), cornerRadius: cornerRadius).addClip();
		// Draw your image
		image.drawInRect(CGRect(origin: CGPointMake(0, 0), size: imageSize))
		// Get the image, here setting the UIImageView image
		image = UIGraphicsGetImageFromCurrentImageContext();
		// Lets forget about that we were drawing
		UIGraphicsEndImageContext();
		return image;
	}
}