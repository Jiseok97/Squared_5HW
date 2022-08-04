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
    
    @IBOutlet weak var forZPositionBtn: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var conditionImgView: UIImageView!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    var gradientLayer : CAGradientLayer!
    
    
    @IBOutlet weak var testBtn: UIButton!
    
    
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTime()
        setupLocation()
        setZPosition()
    }
    
    // MARK: SETTING ZPOSITION
    func setZPosition() {
        self.locationLbl.layer.zPosition = 999
        self.dayLbl.layer.zPosition = 999
        self.conditionLbl.layer.zPosition = 999
        self.conditionImgView.layer.zPosition = 999
        self.temperatureLbl.layer.zPosition = 999
        self.forZPositionBtn.layer.zPosition = 999
        
        
        self.testBtn.layer.zPosition = 999
        
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
    
    // MARK: API
    func requestWeatherForLoction() {
        guard let currentLocation = currentLocation else {
            return
        }
        
        self.long = currentLocation.coordinate.longitude
        self.latt = currentLocation.coordinate.latitude
        print("long = \(long)")
        print("latt = \(latt)")
        let appApiKey = "d069c344f7661d1fb61fa22ea5916a84"
        
        let url = "http://api.openweathermap.org/data/2.5/weather?lat=\(self.latt)&lon=\(self.long)&appid=\(appApiKey)&units=metric"
        

        
        AF.request(url, method: .get, parameters: nil, headers: nil)
            .responseDecodable(of: weatherData.self) { response in
            switch response.result {
            case .success(let response):
                
                if response.main?.temp == nil {
                    self.temperatureLbl.text = "조회 불가"
                } else {
                    guard let temp = response.main?.temp else { return }
                    self.temperatureLbl.text = "\(temp)"
                }
                
//                self.temperatureLbl.text = "\(temp)"
                self.locationLbl.text = response.name
                self.conditionLbl.text = (response.weather?[0].main!)!
                self.conditionImgView.image = UIImage(named: (response.weather?[0].icon!)!)
                
                let change = response.weather?[0].icon!.suffix(1)
                if (change == "n") {
                    self.setDarkGradient()
                } else {
                    self.setLightGradient()
                }
                
            case .failure(let error):
                Swift.print("실패")
                Swift.print(error.localizedDescription)
            }
        }
        Swift.print("http://api.openweathermap.org/data/2.5/weather?lat=\(self.latt)&lon=\(self.long)&appid=d069c344f7661d1fb61fa22ea5916a84&units=metric")
    }
    
    
    
    // MARK: 그라데이션
    func setLightGradient() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.systemTeal.cgColor,
                                     UIColor.systemBlue.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
    func setDarkGradient() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.darkGray.cgColor,
                                     UIColor.lightGray.cgColor,
                                     UIColor.darkGray.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
    
    

    

    // MARK: Dismiss
    @IBAction func exitBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: MOVE AIRPOLLUTION VC
    @IBAction func testBtn(_ sender: Any) {
        let sb = UIStoryboard(name: "AirPollution", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "AirPollutionViewController") as? AirPollutionViewController else { fatalError()}
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

