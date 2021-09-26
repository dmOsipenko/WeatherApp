import UIKit
import CoreLocation
import SDWebImage



class WeatherViewController: UIViewController {
    
    
    @IBOutlet weak var feelsLIkeLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var clodsLable: UILabel!
    @IBOutlet weak var dataLable: UILabel!
    @IBOutlet weak var windLable: UILabel!

    
    
    var data: [SaveWeather] = []
    var lat = 0.0
    var lon = 0.0
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveResult))
        navigationItem.rightBarButtonItem?.tintColor = .blue
    }
    
    @objc func saveResult() {
        showAlert(with: "Успешно", and: "Данные сохранены") {
            RealmManager.shared.writeObject(saveResultWeather: self.data.last ?? self.data[0])
        }
    }
    
}

//MARK: LocationManager

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coord = locations.last else {return}
        lat = coord.coordinate.latitude
        lon = coord.coordinate.longitude
        locationManager.stopUpdatingLocation()
        NetworkManager.shared.getWeather(lat: self.lat, lon: self.lon) { weather in
            guard let temp = weather.main?.temp else {return}
            guard let feelsLike = weather.main?.feelsLike else {return}
            guard let description = weather.weather?[0].description else {return}
            guard let icon = weather.weather?[0].icon else {return}
            guard let wind = weather.wind?.speed else {return}
            guard let clousd = weather.clouds?.all else {return}
            
            self.setupIcon(icon: icon)
            self.tempLable.text = "\(temp)°"
            self.cityLable.text = weather.name
            self.descriptionLable.text = "\(description)"
            self.clodsLable.text = "\(clousd)%"
            self.dataLable.text = self.curentData()
            self.feelsLIkeLable.text = "\(feelsLike)℃"
            self.windLable.text = "\(wind) м/с"
            
            let weather = SaveWeather(temp: temp, wind: wind, name: weather.name, feelsLike: feelsLike, description: description)
            self.data.append(weather)
        } failure: {
            print("NOOOO")
        }
    }
}

extension WeatherViewController {
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = { }) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}






