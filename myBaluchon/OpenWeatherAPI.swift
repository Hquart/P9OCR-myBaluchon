//
//  OpenWeatherAPI.swift
//  myBaluchon
//
//  Created by Naji Achkar on 07/08/2020.
//  Copyright © 2020 Naji Achkar. All rights reserved.

import Foundation

class OpenWeatherAPI: APIService {
    
    let destinationService = Destination()
    
    var session: URLSession
    private var baseUrl: String = "http://api.openweathermap.org/data/2.5/group"
    private var homeCityId: String = "2988507" // Home is "Paris"
    
    private var parameters: [String : String] {
        return [
            "appid": APIKeys.openWeather,
            "id": "\(homeCityId),\(destinationService.cityId)",
            "units": "metric"
        ]
    }
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    func getWeather(completion: @escaping((Result<Weather, APIError>) -> Void )) {
        request(baseUrl: baseUrl, parameters: parameters, completion: completion)
    }
}





