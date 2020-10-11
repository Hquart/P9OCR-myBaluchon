//
//  CurrencyViewController.swift
//  myBaluchon
//
//  Created by Naji Achkar on 04/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import UIKit

final class CurrencyViewController: UIViewController {
    
    //  MARK: - PROPERTIES & OUTLETS
    let fixerService = FixerAPI()
    let destinationService = Destination()
    
    @IBOutlet var currencyTextFields: [UITextField]!
    
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        currencyTextFields[1].isUserInteractionEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        currencyTextFields[0].text = ""
    }
    //  MARK: - IBACTIONS
    @IBAction func dismissKeyboard(_ sender: Any) {
        currencyTextFields[0].resignFirstResponder()
    }
    
    @IBAction func convertButtonTapped(_ sender: Any) {
        toggleActivityIndicator(visible: true, activityIndicator: activityIndicator, button: convertButton)
        guard currencyTextFields[0].text != nil,
            let input = currencyTextFields[0].text,
            let inputValue = Double(input) else {
                presentAlert(message: "Please enter a correct value to convert")
                toggleActivityIndicator(visible: false, activityIndicator: activityIndicator, button: convertButton)
                return }
        fixerService.getRate { 
            switch $0 {
            case .failure(_):
                self.presentAlert(message: "Could not get conversion from server")
            case .success(let result):
                if let rate = result.rates[self.destinationService.outputCurrency] {
                    let formatedOutput = self.formatResult(rate * inputValue)
                    DispatchQueue.main.async {
                        self.toggleActivityIndicator(visible: false, activityIndicator: self.activityIndicator, button: self.convertButton)
                        self.currencyTextFields[1].text = String(formatedOutput) + " " + self.destinationService.outputCurrency
                        self.currencyTextFields[0].text = input + " EUR" //
                    }
                }
            }
        }
    }
}
// MARK: - EXTENSIONS
extension CurrencyViewController {
    
    // this func will format result to a 2 digit String
    func formatResult(_ result: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        guard let formatedResult = formatter.string(from: NSNumber(value: result)) else { return String() }
        return formatedResult 
    }
    
    // Following functions used to set the UI in ViewDidLoad
    func setUI() {
        toggleActivityIndicator(visible: false, activityIndicator: activityIndicator, button: convertButton)
        setTextFields()
        currencyTextFields[1].text = ""
        currencyTextFields[0].placeholder = "EUR"
        currencyTextFields[1].placeholder = destinationService.outputCurrency
    }
    
    func setTextFields() {
        for textField in currencyTextFields {
            textField.setCorner(radius: 15)
            textField.setBorder(width: 3, color: UIColor.Custom.myGreen)
            textField.backgroundColor = .lightGray
        }
    }
    
    func setConvertButton() {
        convertButton.setCorner(radius: 15)
        convertButton.setBorder(width: 4, color: UIColor.Custom.myRed)
        convertButton.setEdgesInset(value: 15)
    }

}




































