//
//  Weather.swift
//  myBaluchon
//
//  Created by Naji Achkar on 07/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.


import Foundation

struct Weather: Decodable {
    let list: [List]
}

struct List: Decodable {
    let weather: [WeatherElement]
    let main: Main
    let name: String
}

struct Main: Decodable {
    let temp: Double
}

struct WeatherElement: Decodable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon 
    }
}
