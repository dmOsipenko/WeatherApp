import UIKit

class MainTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var controllers = [UIViewController]()
        
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storybord.instantiateViewController(identifier: "main") as? WeatherViewController else {return}
        vc.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun"), tag: 0)
        let NavWeathernVC = UINavigationController(rootViewController: vc)
        controllers.append(NavWeathernVC)
        
        let storybordOne = UIStoryboard(name: "Main", bundle: nil)
        guard let vc1 = storybordOne.instantiateViewController(identifier: "google") as? GoogleMapViewController else {return}
        
        vc1.tabBarItem = UITabBarItem(title: "Google", image: UIImage(systemName: "map"), tag: 1)
        let NavGoogleVC = UINavigationController(rootViewController: vc1)
        controllers.append(NavGoogleVC)
        self.viewControllers = controllers
        
        let storybordTwo = UIStoryboard(name: "Main", bundle: nil)
        guard let vc2 = storybordTwo.instantiateViewController(identifier: "save") as? SaveResultViewController else {return}
        
        vc2.tabBarItem = UITabBarItem(title: "Data", image: UIImage(systemName: "table"), tag: 2)
        let NavSaveVC = UINavigationController(rootViewController: vc2)
        controllers.append(NavSaveVC)
        self.viewControllers = controllers
        
    }
    
    
}

