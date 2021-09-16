//
//  AirPollutionViewController.swift
//  myToday
//
//  Created by 이지석 on 2021/07/29.
//

import UIKit
import Alamofire

class AirPollutionViewController: UIViewController {
    
    @IBOutlet weak var o3Lbl: UILabel!
    @IBOutlet weak var co2Lbl: UILabel!
    @IBOutlet weak var no2Lbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dustImg: UIImageView!
    @IBOutlet weak var dustLbl: UILabel!
    @IBOutlet weak var dustExplainLbl: UILabel!
    @IBOutlet weak var pm10ValueLbl: UILabel!
    @IBOutlet weak var o3Img: UIImageView!
    @IBOutlet weak var o3ValueLbl: UILabel!
    @IBOutlet weak var co2Img: UIImageView!
    @IBOutlet weak var co2ValueLbl: UILabel!
    @IBOutlet weak var no2Img: UIImageView!
    @IBOutlet weak var no2ValueLbl: UILabel!
    @IBOutlet weak var dateTimeLbl: UILabel!
    
    var gradientLayer : CAGradientLayer!
    
    let url : String = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty"
    let parameters : Parameters = [
        "sidoName" : "경기",
        "pageNo" : "1",
        "numOfRows" : "2",
        "returnType" : "json",
        "serviceKey" : "Gd9kQKfYBRl+fk8CBPW9CHL5ZFvQUWQiIR6yQ/84qRh8HclgviJO9lCOI+RHmz+PZ9FMdjJWgzn31z8MmVNN2g==",
        "ver" : "1.0"
    ]
    
    // MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        setTime()
        setZPostion()
        requestAirPollutionForLoction()
    }
    
    // MARK: SETTING TIME
    func setTime() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.dayLbl.text = dateFormatter.string(from: date)
    }
    
    
    // MARK: SET GRADIENT
    func setBluetGradient() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.systemBlue.cgColor,
                                     UIColor.white.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
    func setGreentGradient() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.systemGreen.cgColor,
                                     UIColor.white.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
    func setYellowtGradient() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.systemYellow.cgColor,
                                     UIColor.white.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
    func setRedtGradient() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.systemRed.cgColor,
                                     UIColor.white.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
    
    
    // MARK: SET ZPOSITION
    func setZPostion() {
        self.locationLbl.layer.zPosition = 999
        self.dayLbl.layer.zPosition = 999
        self.dustImg.layer.zPosition = 999
        self.dustLbl.layer.zPosition = 999
        self.dustExplainLbl.layer.zPosition = 999
        self.pm10ValueLbl.layer.zPosition = 999
        self.o3Img.layer.zPosition = 999
        self.o3ValueLbl.layer.zPosition = 999
        self.co2Img.layer.zPosition = 999
        self.co2ValueLbl.layer.zPosition = 999
        self.no2Img.layer.zPosition = 999
        self.no2ValueLbl.layer.zPosition = 999
        self.co2Lbl.layer.zPosition = 999
        self.o3Lbl.layer.zPosition = 999
        self.no2Lbl.layer.zPosition = 999
        self.dateTimeLbl.layer.zPosition = 999
    }
    
    
    
    // MARK: SETTING IMAGE
    func setImage(_ data : String) {
        if (data == "1") {
            self.dustImg.image = UIImage(named: "num1")
            self.dustLbl.text = "좋음"
            self.dustExplainLbl.text = "공기 상태 최고!! 산책 어때요?"
            self.setBluetGradient()
            
        } else if (data == "2") {
            self.dustImg.image = UIImage(named: "num2")
            self.dustLbl.text = "보통"
            self.dustExplainLbl.text = "그냥 무난한 날이에요~~"
            self.setGreentGradient()
            
        } else if (data == "3") {
            self.dustImg.image = UIImage(named: "num3")
            self.dustLbl.text = "나쁨"
            self.dustExplainLbl.text = "공기가 탁해요! 외출은 삼가하죠?"
            self.setYellowtGradient()
            
        } else {
            self.dustImg.image = UIImage(named: "num4")
            self.dustLbl.text = "매우 나쁨"
            self.dustExplainLbl.text = "마스크 필수!! 외출 금지!!"
            self.setRedtGradient()
            
        }
    }
    func setO3Image(_ data : String) {
        if (data == "1") {
            self.o3Img.image = UIImage(named: "num1")
            
        } else if (data == "2") {
            self.o3Img.image = UIImage(named: "num2")
            
        } else if (data == "3") {
            self.o3Img.image = UIImage(named: "num3")
            
        } else {
            self.o3Img.image = UIImage(named: "num4")
            
        }
    }
    func setCo2Image(_ data : String) {
        if (data == "1") {
            self.co2Img.image = UIImage(named: "num1")
            
        } else if (data == "2") {
            self.co2Img.image = UIImage(named: "num2")
            
        } else if (data == "3") {
            self.co2Img.image = UIImage(named: "num3")
            
        } else {
            self.co2Img.image = UIImage(named: "num4")
            
        }
    }
    func setNo2Image(_ data : String) {
        if (data == "1") {
            self.no2Img.image = UIImage(named: "num1")
            
        } else if (data == "2") {
            self.no2Img.image = UIImage(named: "num2")
            
        } else if (data == "3") {
            self.no2Img.image = UIImage(named: "num3")
            
        } else {
            self.no2Img.image = UIImage(named: "num4")
            
        }
    }

    
    
    
    // MARK: GET DATA BY API
    func requestAirPollutionForLoction() {
        
        AF.request(self.url, method: .get, parameters: self.parameters).validate().responseDecodable(of: airPollutionData.self) { response  in
            switch response.result {
            case .success(let response):
                let result = response.response.body
                self.pm10ValueLbl.text = (result.items?[0].pm10Value!)! + "㎍/㎥"
                self.o3ValueLbl.text = (result.items?[0].o3Value!)! + "ppm"
                self.co2ValueLbl.text = (result.items?[0].coValue)! + "ppm"
                self.no2ValueLbl.text = (result.items?[0].no2Value!)! + "ppm"
                print(result.items?[0].khaiGrade)
//
                self.setImage((result.items?[0].khaiGrade)!)
                self.setO3Image((result.items?[0].o3Grade!)!)
                self.setCo2Image((result.items?[0].coGrade!)!)
                self.setNo2Image((result.items?[0].no2Grade!)!)
                self.locationLbl.text = result.items?[0].sidoName!
                self.dateTimeLbl.text = "측정시간: " + (result.items?[0].dataTime!)!
                
            case .failure(let error):
                print("실패 !")
                print(error)
            }
        }
    }
    
    
    
    // MARK: DISMISSS
    @IBAction func exitBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
