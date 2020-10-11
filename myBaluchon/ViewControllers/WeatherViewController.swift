//
//  WeatherViewController.swift
//  myBaluchon
//
//  Created by Naji Achkar on 07/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    //  MARK: - PROPERTIES & OUTLETS
    
    let openWeatherService = OpenWeatherAPI()
    
    @IBOutlet var cityNameLabels: [UILabel]!
    @IBOutlet var tempLabels: [UILabel]!
    @IBOutlet var iconSlots: [UIImageView]!
    @IBOutlet var descriptionLabels: [UILabel]!
    @IBOutlet var weatherLayouts: [UIStackView]!
    
    // MARK: - METHODS
    
    override func viewDidLoad() {
        weatherLayouts[0].addBackground(color: UIColor.Custom.myGreen)
        weatherLayouts[1].addBackground(color: .lightGray)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateWeather() // Weather is updated each time the view appears
    }
    
    func updateWeather() {
        print(Thread.current)
        openWeatherService.getWeather { [unowned self] result in // queue change here
            print(Thread.current)
            DispatchQueue.main.async {
                switch result {
                case .failure(_):
                    self.presentAlert(message: "Une erreur est survenue")
                case .success(let result):
                    self.setUI(data: result, // updating the UI according to data received
                               nameLabels: [self.cityNameLabels[0], self.cityNameLabels[1]],
                               tempLabels: [self.tempLabels[0], self.tempLabels[1]],
                               descriptionLabels: [self.descriptionLabels[0], self.descriptionLabels[1]],
                               images: [self.iconSlots[0], self.iconSlots[1]])
                }
            }
            print(Thread.current)
        }
    }
}
// MARK: - EXTENSIONS
extension WeatherViewController {
    
    private func setUI(data: Weather, nameLabels: [UILabel], tempLabels: [UILabel], descriptionLabels: [UILabel], images: [UIImageView]) {
        for (index, label) in nameLabels.enumerated() {
            label.text = String(data.list[index].name)
        }
        for (index, label) in tempLabels.enumerated() {
            label.text = String(data.list[index].main.temp) + " c°"
        }
        for (index, label) in descriptionLabels.enumerated() {
            label.text = data.list[index].weather[0].weatherDescription
        }
        for (index, image) in images.enumerated() {
            image.image = UIImage(named: data.list[index].weather[0].icon)
        }
    }
}


