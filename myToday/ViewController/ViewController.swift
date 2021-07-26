//
//  ViewController.swift
//  myToday
//
//  Created by 이지석 on 2021/07/26.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation
// CoreLocation = 현재 위치

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var conditionImgView: UIImageView!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
//    var currentWeather: Current?
    var temperature: Double = 0.0
    var icon: String = ""
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.fetchWeather()
        

        weatherInfoDataManager().getWeather(self)
    }
    
    
    
//    func fetchWeather() {
//        weatherInfoDataManager().getWeather { result in
//            switch result {
//            case .success(let weatherResponse):
//                DispatchQueue.main.async {
//                    self.currentWeather = weatherResponse.current
//                    self.temperature = self.currentWeather?.temp ?? 0.0
//                    self.temperatureLbl.text = "\(self.temperature)"
//                    self.conditionImgView.image = UIImage(named: self.icon)
//                    print(String(self.temperature) + "\n" + self.icon)
//                }
//            case .failure(_ ):
//                print("error")
//
//            }
//        }
//    }
}

