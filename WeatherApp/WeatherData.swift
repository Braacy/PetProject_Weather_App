//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Владислав  on 24.08.2024.
//

import Foundation

struct WeatherData: Decodable {
    
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
}


struct Info: Decodable {
    
    let url: String
    
}


struct Fact: Decodable {
    
    let temp: Double
    let icon: String
    let condition: String
    
    
    enum CodingKeys: String, CodingKey {
        case temp
        case icon
        case condition
        
        
    }
}

struct Forecast: Decodable {
    
    let parts: Parts
}

struct Parts: Decodable {
    
    let day: Day
}

struct Day: Decodable {
    
    let tempMin: Int?
    let tempMax: Int?
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
