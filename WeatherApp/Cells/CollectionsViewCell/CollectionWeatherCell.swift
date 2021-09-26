//
//  CollectionWeatherCell.swift
//  WeatherApp
//
//  Created by Дмитрий Осипенко on 23.05.21.
//

import UIKit

class CollectionWeatherCell: UICollectionViewCell {
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var cloudLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupWith(saveWeather: SaveWeather) {
        cloudLable.text = "\(saveWeather.cloud)"
        tempLable.text = "\(saveWeather.temp)"
    }
}
