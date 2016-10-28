//
//  UIViewController+.swift
//  SwiftExtenions
//
//  Created by sergey petrachkov on 17/08/16.
//  Copyright © 2016 actonica. All rights reserved.
//

public extension UIViewController {
	func setNavigationItemBackButtonImage(backIndicatorImageName: String,
	                                      backIndicatorTransitionMaskImageName : String,
	                                      renderingMode : UIImageRenderingMode = .alwaysOriginal) {
		self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: backIndicatorImageName)?.withRenderingMode(.alwaysOriginal);
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: backIndicatorTransitionMaskImageName)?.withRenderingMode(renderingMode);
	}
	func setupTransparentNavigationBar(){
		setupNavigationBar(backgroundImage: UIImage(), shadowImage: UIImage());
	}
	func setupNavigationBar(backgroundImage: UIImage?, shadowImage: UIImage?, barMetrics : UIBarMetrics = .default){
		self.navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: barMetrics);
		self.navigationController?.navigationBar.shadowImage = shadowImage;
	}
	func showAlert(_ title: String, message : String){
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert);
		alertController.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: nil));
		self.present(alertController, animated: true, completion: nil);
	}
	func setAudioState(_ active: Bool){
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
