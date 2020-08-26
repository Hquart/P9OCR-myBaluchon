//
//  ViewController.swift
//  myBaluchon
//
//  Created by Naji Achkar on 12/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//


import UIKit

extension UIViewController {
    // These generic functions are used in all our ViewControllers
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    //
    func toggleActivityIndicator(visible: Bool, activityIndicator: UIActivityIndicatorView, button: UIButton) {
        activityIndicator.isHidden = !visible
        button.isHidden = visible
    }
}
