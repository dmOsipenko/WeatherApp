
import UIKit
import GoogleMaps

class GoogleMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
}

//MARK: GoogleMap Delegate
extension GoogleMapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        NetworkManager.shared.getWeather(lat: coordinate.latitude, lon: coordinate.longitude) { weather in
            guard let temp = weather.main?.temp else {return}
            guard let feelsLike = weather.main?.feelsLike else {return}
            guard let description = weather.weather?[0].description else {return}
            guard let wind = weather.wind?.speed else {return}
            guard let cloud = weather.clouds?.all else {return}
        
            
            
            let alert = UIAlertController(title: "Погода в выбранном месте", message: "Город \(weather.name). Темпиратура \(temp)℃. Вероятность осадков \(cloud)%", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel) { action in

                                    })
            alert.addAction(UIAlertAction(title: "Сохранить", style: .default) { action in
                let saveWeather = SaveWeather(temp: temp, wind: wind, name: weather.name, feelsLike: feelsLike, description: description)
                RealmManager.shared.writeObject(saveResultWeather: saveWeather)
                                    })
            self.present(alert, animated: true, completion: nil)
            

            
        } failure: {
            print("Неудача")
        }
        
    }
}
