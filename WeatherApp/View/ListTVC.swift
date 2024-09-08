//
//  ListTVC.swift
//  WeatherApp
//
//  Created by Владислав  on 23.08.2024.
//

import UIKit


class ListTVC: UITableViewController {
    
    let emptyCities = Weather()
    
    var citiesArray = [Weather]()
    
    let nameCityArray = ["Москва", "Санкт-Петербуг", "Калининград", "Воронеж", "Сочи", "Мурманск", "Владивосток"]
    
    let networkWeatherManager = NetworkWeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if citiesArray.isEmpty {
            citiesArray = Array(repeating: emptyCities, count: nameCityArray.count)
        }
        
        addCities()
        
    }
    
    
    func addCities() {
        
        getCityWeather(citiesArray: self.nameCityArray) { (index, weather) in
          
                self.citiesArray[index] = weather
                self.citiesArray[index].name = self.nameCityArray[index]
     
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
               }
            }
        }
    
    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell
       var weather = Weather()
        
        weather = citiesArray[indexPath.row]
        
        cell.configure(weather: weather)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (_, _, comletionHandler) in
            let editingRow = self.nameCityArray[indexPath.row]
            
            if let index = self.nameCityArray.firstIndex(of: editingRow) {
                self.citiesArray.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            
            guard let indexPath = tableView.indexPathsForSelectedRows?.first else { return }
            
            let cityWeather = citiesArray[indexPath.row]
            
            let dstVC = segue.destination as! DetailVC
            dstVC.weatherModel = cityWeather
        }
    }

}
