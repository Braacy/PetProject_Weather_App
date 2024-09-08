//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Владислав  on 24.08.2024.
//

import Foundation


struct NetworkWeatherManager {
    
    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Weather) ->Void) {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-Weather-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            //print(String(data: data, encoding: .utf8)!)
            if let weather = self.parceJSON(whithData: data) {
               completionHandler(weather)
        
            }
        }
        task.resume()
    }
    
    
    
    func parceJSON(whithData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
            }
            return weather
        } catch let error as NSError {
            print(String(describing: error))
          
        }
        return nil
    }
}
