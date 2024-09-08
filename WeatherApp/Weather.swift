//
//  Weather.swift
//  WeatherApp
//
//  Created by Владислав  on 24.08.2024.
//

import Foundation

struct Weather {
    
    var name: String = "Название"
    var temperature: Double = 0.0
    var temperatureString: String {
        String(format: "%.0f", temperature)
    }
    var conditionCode: String = ""
    var url: String = ""
    var condition: String = ""
    
    
    
    var conditionString: String {
        switch condition {
        case "clear" : return "ясно"
        case "partly-cloudy" : return "малооблачно"
        case "cloudy" : return "облачно с прояснениями"
        case "overcast" : return "пасмурно"
        case "ight-rain" : return "небольшой дождь"
        case "rain" : return "дождь"
        case "heavy-rain" : return "сильный дождь"
        case "showers" : return "ливень"
        case "wet-snow" : return "дождь со снегом"
        case "light-snow" : return "небольшой снег"
        case "snow" : return "снег"
        case "snow-showers" : return "снегопад"
        case "hail" : return "град"
        case "thunderstorm" : return "гроза"
        case "thunderstorm-with-rain" : return "дождь с грозой"
        case "thunderstorm-with-hail" : return "гроза с градом"
            
        default : return "Загрузка ..."
        }
    }
    
    
    init?(weatherData: WeatherData) {
        
        temperature = weatherData.fact.temp
        conditionCode = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
    }
    
    init(){
        
    }
}
