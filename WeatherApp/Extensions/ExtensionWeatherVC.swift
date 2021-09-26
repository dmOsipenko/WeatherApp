
import Foundation
import UIKit

extension WeatherViewController {
    //MARK: Загрузка изображения
    func setupIcon(icon: String) {
        avatarImage.image = UIImage(named: icon)
    }
    
    //MARK: Текущая дата
    func curentData() -> String {
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)        
        let formatteddate = formatter.string(from: time as Date)
        return formatteddate
    }
    
    
    //MARK: NetworkManager Coordinats (get)
//    func networkingCoordinat(lat: Double, lon: Double) {
//        NetworkManager.shared.getWeather(lat: lat, lon: lon) { weather in
//            guard let temp = weather.main?.temp else {return}
//            guard let feelsLike = weather.main?.feelsLike else {return}
//            guard let minTemp = weather.main?.tempMin else {return}
//            guard let maxTemp = weather.main?.tempMax else {return}
//            guard let feelsLike = weather.main?.feelsLike else {return}
//            guard let description = weather.weather?[0].description else {return}
//            guard let icon = weather.weather?[0].icon else {return}
//            guard let wind = weather.wind?.speed else {return}
//            
//            
//            self.setupIcon(icon: icon)
//            self.tempLable.text = "\(temp)°"
//            self.cityLable.text = weather.name
//            self.descriptionLable.text = "\(description)"
//            self.dataLable.text = self.curentData()
//            self.feelsLIkeLable.text = """
//                 Темпиратура по ощущению - \(feelsLike)℃
//                 ↓ \(minTemp)℃ / ↑\(maxTemp)℃"
//                 """
//            self.windLable.text = "Скорость ветра \(wind) м/с"
//        } failure: {
//            print("NOOOO")
//        }
//    }
    
    
    //MARK: NetworkManager City (get)
    func getCity(city: String) {
        NetworkManager.shared.getCity(city: city) { weather in
            guard let temp = weather.main?.temp else {return}
            guard let feelsLike = weather.main?.feelsLike else {return}
            guard let minTemp = weather.main?.tempMin else {return}
            guard let maxTemp = weather.main?.tempMax else {return}
            guard let feelsLike = weather.main?.feelsLike else {return}
            guard let description = weather.weather?[0].description else {return}
            guard let icon = weather.weather?[0].icon else {return}
            guard let wind = weather.wind?.speed else {return}
            
            self.setupIcon(icon: icon)
            self.tempLable.text = "\(temp)°"
            self.cityLable.text = weather.name
            self.descriptionLable.text = "\(description)"
            self.dataLable.text = self.curentData()
            self.feelsLIkeLable.text = """
                 Темпиратура по ощущению - \(feelsLike)℃
                 ↓ \(minTemp)℃ / ↑\(maxTemp)℃"
                 """
            self.windLable.text = "Скорость ветра \(wind) м/с"
        } failure: {
            print("NOOOO")
        }
    }
    
    

}












// загрузка картинки с сайта openweather

//    func setupIcon(icon: String) {
//        let icon = icon
//        guard let url = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png") else {return}
//        self.avatarImage.sd_setImage(with: url, completed: nil)
//        self.avatarImage.contentMode = .scaleAspectFill
//}
