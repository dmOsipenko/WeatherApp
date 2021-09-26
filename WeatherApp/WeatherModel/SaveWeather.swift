
import Foundation
import UIKit
import  RealmSwift

class SaveWeather: Object {
    @objc dynamic  var name = ""
    @objc dynamic var wind = 0.0
    @objc dynamic var temp = 0
    @objc dynamic var feelsLike = 0
    @objc dynamic var descriptions = ""
   
  
    
    override init() {
    }
    
    convenience init(temp: Int, wind: Double, name: String, feelsLike: Int, description: String) {
        self.init()
        self.temp = temp
        self.feelsLike = feelsLike
        self.wind = wind
        self.name = name
        self.descriptions = description
        
        
     
    }
}
