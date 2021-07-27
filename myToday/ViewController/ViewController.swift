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
    
    var temperature: Double = 0.0
    var icon: String = ""
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTime()
        weatherInfoDataManager().getWeather(self)
        
    }
    
    func setTime() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.dayLbl.text = dateFormatter.string(from: date)
    }
    
}

