//
//  weatherInfoDataManager.swift
//  myToday
//
//  Created by 이지석 on 2021/07/26.
//

import Foundation
import Alamofire

enum NetWorkError: Error {
    case badUrl
    case noData
    case decodingError
}


class weatherInfoDataManager{
//
//    func getWeather(_ viewcontroller: ViewController) {
//        AF.request("http://api.openweathermap.org/data/2.5/weather?lat=37.179&lon=127.046&appid=d069c344f7661d1fb61fa22ea5916a84&units=metric", method: .get).validate().responseDecodable(of: weatherData.self) { response in
//            switch response.result {
//            case .success(let response):
//
//                var temp : Int = 0
//                temp = Int((response.main?.temp)!)
//
//                print("성공")
//                print((response.main?.temp!)!)
//                print(response.name!)
//                print((response.main?.temp_min)!)
//                print((response.main?.temp_max)!)
//                print((response.weather?[0].main!)!)
//                print((response.weather?[0].icon!)!)
//
//
//                viewcontroller.temperatureLbl.text = "\(temp)"
//                viewcontroller.locationLbl.text = response.name
//                viewcontroller.conditionLbl.text = (response.weather?[0].main!)!
//                viewcontroller.conditionImgView.image = UIImage(named: (response.weather?[0].icon!)!)
//
//
//            case .failure(let error):
//                print("실패")
//                print(error.localizedDescription)
//            }
//        }
//    }
    
}
