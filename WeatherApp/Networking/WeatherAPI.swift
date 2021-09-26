import Foundation
import Moya

enum WeatherApi {
    case getWeather(lat: Double, lon: Double)
    case getCity(city: String)
}

extension WeatherApi: TargetType {

    var baseURL: URL {
        switch self {
        case .getWeather:
            return URL(string: "https://api.openweathermap.org")!
        case .getCity:
            return URL(string: "https://api.openweathermap.org")!
        }
    }
    
    var path: String {
        switch self {
        
        case .getWeather:
            return "/data/2.5/weather"
        case .getCity:
            return "/data/2.5/weather"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeather:
            return .get
        case .getCity:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameter:[String: Any]? {
        var params = [String: Any]()
        switch self {
        case .getWeather(let lat, let lon):
            params["lat"] = lat
            params["lon"] = lon
            params["appid"] = "2e5cb6d41d011272ce8cf6e52dfa695c"
            params["units"] = "metric"
            params["lang"] = "ru"
        case .getCity(let city):
            params["q"] = city
            params["appid"] = "2e5cb6d41d011272ce8cf6e52dfa695c"
            params["units"] = "metric"
            params["lang"] = "ru"
        }
        return params
    }
    
    var task: Task {
        guard let params = parameter else {
            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }

}
