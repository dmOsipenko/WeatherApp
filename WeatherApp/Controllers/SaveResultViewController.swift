

import UIKit

class SaveResultViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var data: [SaveWeather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: String(describing: TableWeatherCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: TableWeatherCell.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        data = RealmManager.shared.readObjects()
        tableView.reloadData()
        
        
    }
    @IBAction func deleteAll(_ sender: Any) {
        RealmManager.shared.removeAllData()
        data.removeAll()
        tableView.reloadData()
    }
}

extension SaveResultViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = deleteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [done])
    }
    
    func deleteAction (at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
          let removeData = self.data.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            RealmManager.shared.deleteObject(delete: removeData)
            completion(true)
        }
        action.backgroundColor = .systemRed
        action.image = UIImage(systemName: "delete.left.fill")
        action.title = "Удалить"
        return action
    }
}

extension SaveResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableWeatherCell.self), for: indexPath)
        guard let resultCell = cell as? TableWeatherCell else {return cell}
        resultCell.setupWith(saveWeather: data[indexPath.row])
        return resultCell
    }
}
