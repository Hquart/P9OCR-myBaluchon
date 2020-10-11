//
//  TranslationViewController.swift
//  myBaluchon
//
//  Created by Naji Achkar on 07/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//
import UIKit

final class TranslationViewController: UIViewController, UITextViewDelegate  {
    
    //  MARK: - PROPERTIES & OUTLETS
    let translationService = GoogleAPI()
    let destinationService = Destination()
    
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var translateButton: UIButton!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        inputTextView.delegate = self
        outputTextView.isUserInteractionEnabled = false
        setUI()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        inputTextView.text = ""
        outputTextView.text = ""
        translateButton.setTitle("Tap to translate to \(destinationService.outputLanguage)", for: .normal)
    }
    
    //  MARK: - IBACTIONS
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.inputTextView.resignFirstResponder()
    }
    
    @IBAction func translateButtonTapped(_ sender: Any) {
        toggleActivityIndicator(visible: true, activityIndicator: activityIndicator, button: translateButton)
        guard inputTextView.text != nil,
            let textToTranslate = inputTextView.text else {
                toggleActivityIndicator(visible: false, activityIndicator: activityIndicator, button: translateButton)
                presentAlert(message: "Please enter a text to translate")
                return }
        translationService.input = textToTranslate
        translationService.getTranslation {
            switch $0 {
            case .failure(_):
                self.presentAlert(message: "Could not get translation from server")
            case .success(let result):
                let output = result.data.translations[0].translatedText
                DispatchQueue.main.async {
                    self.toggleActivityIndicator(visible: false, activityIndicator: self.activityIndicator, button: self.translateButton)
                    self.outputTextView.text = output
                }
            }
        }
    }
}
// MARK: - EXTENSIONS

extension TranslationViewController {
    
    // Once the user clicks in the textfield, previous text is removed for a new translation
       func textViewDidBeginEditing(_ textView: UITextView) {
           textView.text = ""
       }
    // Following functions used to set the UI in ViewDidLoad
    func setUI() {
        toggleActivityIndicator(visible: false, activityIndicator: self.activityIndicator, button: translateButton)
        setTextView(textView: inputTextView, radius: 10, width: 2, borderColor: UIColor.Custom.myGreen, backgroundColor: .lightGray, yValue: 20, xValue: 50)
        setTextView(textView: outputTextView, radius: 10, width: 2, borderColor: UIColor.Custom.myGreen, backgroundColor: .lightGray, yValue: 20, xValue: 50)
        translateButton.setCorner(radius: 10)
        translateButton.setBorder(width: 2, color: UIColor.Custom.myRed)
        translateButton.setEdgesInset(value: 20)
    }
    
    func setTextView(textView: UITextView, radius: CGFloat, width: CGFloat, borderColor: UIColor, backgroundColor: UIColor, yValue: CGFloat, xValue: CGFloat) {
        textView.setCorner(radius: radius)
        textView.setBorder(width: width, color: borderColor)
        textView.backgroundColor = backgroundColor
        textView.textContainerInset = UIEdgeInsets(top: yValue, left: xValue, bottom: yValue, right: xValue)
    }
   
}

