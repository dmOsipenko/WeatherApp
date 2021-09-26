import Foundation
import Moya
import Moya_ObjectMapper


class NetworkManager {
    
    static let shared = NetworkManager()
      
    private let provider = MoyaProvider<WeatherApi>(plugins: [NetworkLoggerPlugin()])
    
    func getWeather(lat: Double, lon: Double, success: @escaping(WeatherData) -> Void, failure: @escaping() ->Void) {
        provider.request(WeatherApi.getWeather(lat: lat, lon: lon)) { result in
            switch result {
            case.success(let response):
                guard let weather = try? response.mapObject(WeatherData.self) else {
                    failure()
                    return
                }
                success(weather)
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func getCity(city: String, success: @escaping(WeatherData) -> Void, failure: @escaping() ->Void) {
        provider.request(WeatherApi.getCity(city: city)) { result in
            switch result {
            case let .success(response):
                guard let weather = try? response.mapObject(WeatherData.self) else {
                    failure()
                    return
                    
                }
                success(weather)
            case.failure(let error):
                print(error)
            }
        }
    }
}
