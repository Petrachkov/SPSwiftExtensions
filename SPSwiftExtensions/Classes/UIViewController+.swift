//
//  UIViewController+.swift
//  SwiftExtenions
//
//  Created by sergey petrachkov on 17/08/16.
//  Copyright © 2016 actonica. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

public extension UIViewController {
	func setNavigationItemBackButtonImage(backIndicatorImageName backIndicatorImageName: String,
									 backIndicatorTransitionMaskImageName : String,
									 renderingMode : UIImageRenderingMode = .AlwaysOriginal) {
		self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: backIndicatorImageName)?.imageWithRenderingMode(.AlwaysOriginal);
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: backIndicatorTransitionMaskImageName)?.imageWithRenderingMode(renderingMode);
	}
	func setupTransparentNavigationBar(){
		setupNavigationBar(backgroundImage: UIImage(), shadowImage: UIImage());
	}
	func setupNavigationBar(backgroundImage backgroundImage: UIImage?, shadowImage: UIImage?, barMetrics : UIBarMetrics = .Default){
		self.navigationController?.navigationBar.setBackgroundImage(backgroundImage, forBarMetrics: barMetrics);
		self.navigationController?.navigationBar.shadowImage = shadowImage;
 	}
	func showAlert(title: String, message : String){
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert);
		alertController.addAction(UIAlertAction(title: "Ok!", style: .Cancel, handler: nil));
		self.presentViewController(alertController, animated: true, completion: nil);
	}
	func setAudioState(active: Bool){
		do{
			if(active){
				try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
			}
			else{
				try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
			}
			
		}
		catch{
			NSLog("an error occured while making some fun with avaudiosession. Look at setAudioState, active param = \(active)");
		}
	}
}
