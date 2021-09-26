import Foundation
import ObjectMapper



class WeatherData: Mappable {
    var main: Main?
    var wind: Wind?
    var system: System?
    var clouds: Clouds?
    var weather: [Weather]?
    var name = ""
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        weather         <- map["weather"]
        name            <- map["name"]
        system          <- map["sys"]
        wind            <- map["wind"]
        main            <- map["main"]
        clouds          <- map["clouds"]
        
    }
}

class Main: Mappable {
    var temp = 0
    var feelsLike = 0
    var tempMin = 0
    var tempMax = 0
    
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        temp           <- map["temp"]
        feelsLike      <- map["feels_like"]
        tempMin      <- map["temp_min"]
        tempMax      <- map["temp_max"]
        
    }
    
}


class Wind: Mappable {
    var speed = 0.0
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        speed       <- map["speed"]
        
    }
}

class Clouds: Mappable {
    var all = 0
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        all       <- map["all"]
        
    }
}



class System: Mappable {
    var country = ""
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        country        <- map["country"]
        
    }
    
}

class Weather: Mappable {
    var description = ""
    var icon = ""
    
    init() {
        
    }
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        description        <- map["description"]
        icon               <- map["icon"]
        
    }
    
}




