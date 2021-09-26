import Foundation
import RealmSwift



class RealmManager {
    
//    создаём синглтон менеджера
    static let shared = RealmManager()
    let realm = try! Realm()
    
    private init() { }
    
//    метод записи объекта. Все изменения (запись, изменение, удаление) делаются в блоке write
    func writeObject(saveResultWeather: SaveWeather) {
        try! realm.write {
            realm.add(saveResultWeather)
        }
    }
    
//    удаление всех данных
    func removeAllData() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func deleteObject(delete: SaveWeather) {
        try! realm.write {
            realm.delete(delete)
        }
            
        
    }
    
//    чтение нашего определённого класса с переводом в массив
    func readObjects() -> [SaveWeather] {
       return Array(realm.objects(SaveWeather.self))
    }
}
