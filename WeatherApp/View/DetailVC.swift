//
//  DetailVC.swift
//  WeatherApp
//
//  Created by Владислав  on 25.08.2024.
//

import UIKit
import SwiftSVG

class DetailVC: UIViewController {

    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tempCityLabel: UILabel!
    
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
refreshLabels()
    }
    
    func refreshLabels() {
        
        nameCityLabel.text = weatherModel?.name
        
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.conditionCode).svg")
        
        let weatherImage = UIView(SVGURL: url!) { (image) in
            image.resizeToFit(self.viewCity.bounds)
        }
        
        self.viewCity.addSubview(weatherImage)
        
        conditionLabel.text = weatherModel?.conditionString
        tempCityLabel.text = weatherModel?.temperatureString
    }
}
