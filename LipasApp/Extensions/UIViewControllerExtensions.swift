//
//  UIViewControllerExtension.swift
//  LipasApp
//
//  Created by Niko Lipponen on 22.7.2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    /// Show basic alert
    func showAlert(title: String, message: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                      
        self.present(alert, animated: true, completion: nil)
    }
}
