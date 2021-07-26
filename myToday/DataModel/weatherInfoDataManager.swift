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


class weatherInfoDataManager {
    func getWeather(_ viewcontroller: ViewController) {
        AF.request("http://api.openweathermap.org/data/2.5/weather?lat=37.179&lon=127.046&appid=d069c344f7661d1fb61fa22ea5916a84&units=metric", method: .get).validate().responseDecodable(of: weatherData.self) { response in
            switch response.result {
            case .success(let response):
                print("성공")
                print(response.main.temp)
                print(response.name)
                viewcontroller.temperatureLbl.text = "\(response.main.temp)"
                viewcontroller.locationLbl.text = response.name
            case .failure(let error):
                print("실패")
                print(error.localizedDescription)
            }
        }
    }
}
    

