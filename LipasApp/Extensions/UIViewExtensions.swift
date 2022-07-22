//
//  UIViewExtensions.swift
//  LipasApp
//
//  Created by Niko Lipponen on 21.7.2022.
//

import Foundation
import UIKit


extension UIView {
    static let indicatorViewTag = 10000001
    
    /// Adds loadingIndicatorView to UIView and starts animating it
    func showLoader() {
        var indicatorView = viewWithTag(UIView.indicatorViewTag) as? UIActivityIndicatorView
        
        if indicatorView == nil {
            indicatorView = UIActivityIndicatorView()
        }
        
        indicatorView?.tag = UIView.indicatorViewTag
        
        indicatorView?.hidesWhenStopped = true
        indicatorView?.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        
        addSubview(indicatorView!)
        
        //set to full size of parent view
        indicatorView!.translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: indicatorView!.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: indicatorView!.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: indicatorView!.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: indicatorView!.bottomAnchor).isActive = true
        
        indicatorView?.startAnimating()
    }
    
    /// Stops animating loadingIndicator subview and removes it if exists
    func dismissLoader() {
        let indicatorView = viewWithTag(UIView.indicatorViewTag) as? UIActivityIndicatorView
        indicatorView?.stopAnimating()
        indicatorView?.removeFromSuperview()
    }
}
