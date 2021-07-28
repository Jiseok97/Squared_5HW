//
//  AirPollutionViewController.swift
//  myToday
//
//  Created by 이지석 on 2021/07/29.
//

import UIKit
import Alamofire

class AirPollutionViewController: UIViewController {
    
    let serviceKey = "Gd9kQKfYBRl%2Bfk8CBPW9CHL5ZFvQUWQiIR6yQ%2F84qRh8HclgviJO9lCOI%2BRHmz%2BPZ9FMdjJWgzn31z8MmVNN2g=="
    let returnType = "JSON"
    let numOfRows : Int = 1
    let pageNo : Int = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()

        requestAirPollutionForLoction()
    }
    
    
    func requestAirPollutionForLoction() {
        
        AF.request("http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?sidoName=서울&pageNo=1&numOfRows=100&returnType=JSON&serviceKey=Gd9kQKfYBRl%2Bfk8CBPW9CHL5ZFvQUWQiIR6yQ%2F84qRh8HclgviJO9lCOI%2BRHmz%2BPZ9FMdjJWgzn31z8MmVNN2g%3D%3D&ver=1.0", method: .get).validate().responseDecodable(of: airPollutionData.self) { response in
            switch response.result {
            case .success(let response):
                Swift.print("성공")
                Swift.print(response.response.item?[0].pm10Value!)
                
                
                
            case .failure(let error):
                Swift.print("실패")
                Swift.print(error)
//                Swift.print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func exitBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
