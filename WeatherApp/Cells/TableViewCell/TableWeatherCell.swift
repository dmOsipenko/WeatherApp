import UIKit

class TableWeatherCell: UITableViewCell {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var feelsLikeLable: UILabel!
    @IBOutlet weak var descriptionsLable: UILabel!
    @IBOutlet weak var windLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupWith(saveWeather: SaveWeather) {
        nameLable.text = "\(saveWeather.name)"
        tempLable.text = "темпиратура \(saveWeather.temp)℃"
        feelsLikeLable.text = "По ощущению \(saveWeather.feelsLike)℃"
        descriptionsLable.text = "\(saveWeather.descriptions)"
        windLable.text = "скорость ветра \(saveWeather.wind) м/с"
    }
}
