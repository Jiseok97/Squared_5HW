//
//  ViewController.swift
//  myToday
//
//  Created by 이지석 on 2021/07/26.
//

import UIKit
import Alamofire
import CoreLocation


class WeatherViewController: UIViewController, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    
    var latt : Double = 0.0
    var long : Double = 0.0
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var conditionImgView: UIImageView!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTime()
        setupLocation()
    }
    
    
    // MARK: 요일 추출
    func setTime() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.dayLbl.text = dateFormatter.string(from: date)
    }
    
    
    // MARK: 현재 위도,경도 추출
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLoction()
        }
    }
    
    func requestWeatherForLoction() {
        guard let currentLocation = currentLocation else {
            return
        }
        self.long = currentLocation.coordinate.longitude
        self.latt = currentLocation.coordinate.latitude
        
        AF.request("http://api.openweathermap.org/data/2.5/weather?lat=\(self.latt)&lon=\(self.long)&appid=d069c344f7661d1fb61fa22ea5916a84&units=metric", method: .get).validate().responseDecodable(of: weatherData.self) { response in
            switch response.result {
            case .success(let response):
                var temp : Int = 0
                temp = Int((response.main?.temp)!)
                
                self.temperatureLbl.text = "\(temp)"
                self.locationLbl.text = response.name
                self.conditionLbl.text = (response.weather?[0].main!)!
                self.conditionImgView.image = UIImage(named: (response.weather?[0].icon!)!)
                
                
            case .failure(let error):
                Swift.print("실패")
                Swift.print(error.localizedDescription)
            }
        }
        Swift.print("http://api.openweathermap.org/data/2.5/weather?lat=\(self.latt)&lon=\(self.long)&appid=d069c344f7661d1fb61fa22ea5916a84&units=metric")
    }
    
    
    
    @IBAction func exitBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

