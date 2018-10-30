//
//  ViewControllerExtensions.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/21/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import UIKit
fileprivate let overlayViewTag = 999
fileprivate let activityIndicatorTag = 1000


extension UIViewController {
    // MARK: Alert View
    func showErrorAlert(errorTitle:String){
        let alertController = UIAlertController(title: errorTitle, message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    // MARK: Activity Indicator Overlay

    public func displayActivityIndicator(shouldDisplay: Bool) -> Void {
            if shouldDisplay {
                setActivityIndicator()
            } else {
                removeActivityIndicator()
            }
        }
        
        private func setActivityIndicator() -> Void {
            guard !isDisplayingActivityIndicatorOverlay() else { return }
            guard let parentViewForOverlay = navigationController?.view ?? view else { return }
            
            //configure overlay
            let overlay = UIView()
            overlay.translatesAutoresizingMaskIntoConstraints = false
            overlay.backgroundColor = UIColor.black
            overlay.alpha = 0.5
            overlay.tag = overlayViewTag
            
            //configure activity indicator
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.tag = activityIndicatorTag
            
            //add subviews
            overlay.addSubview(activityIndicator)
            parentViewForOverlay.addSubview(overlay)
            
            //add overlay constraints
            overlay.heightAnchor.constraint(equalTo: parentViewForOverlay.heightAnchor).isActive = true
            overlay.widthAnchor.constraint(equalTo: parentViewForOverlay.widthAnchor).isActive = true
            
            //add indicator constraints
            activityIndicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true
            
            //animate indicator
            activityIndicator.startAnimating()
        }
        
        private func removeActivityIndicator() -> Void {
            let activityIndicator = getActivityIndicator()
            
            if let overlayView = getOverlayView() {
                UIView.animate(withDuration: 0.2, animations: {
                    overlayView.alpha = 0.0
                    activityIndicator?.stopAnimating()
                }) { (finished) in
                    activityIndicator?.removeFromSuperview()
                    overlayView.removeFromSuperview()
                }
            }
        }
        
        private func isDisplayingActivityIndicatorOverlay() -> Bool {
            if let _ = getActivityIndicator(), let _ = getOverlayView() {
                return true
            }
            return false
        }
        
        private func getActivityIndicator() -> UIActivityIndicatorView? {
            return (navigationController?.view.viewWithTag(activityIndicatorTag) ?? view.viewWithTag(activityIndicatorTag)) as? UIActivityIndicatorView
        }
        
        private func getOverlayView() -> UIView? {
            return navigationController?.view.viewWithTag(overlayViewTag) ?? view.viewWithTag(overlayViewTag)
        }
}
