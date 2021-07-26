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
                if String(response.main.temp) != nil {
                    print(response.main.temp)
                    viewcontroller.conditionLbl.text = String(response.main.temp)
                }
            case .failure(let error):
                print("실패")
                print(error.localizedDescription)
            }
        }
        
        
        
    }
}
    
    
    
    
    
    
    
//
//    let url = URL(string: "api.openweathermap.org/data/2.5/weather?lat=37.179&lon=127.046&appid=d069c344f7661d1fb61fa22ea5916a84&units=metric")
//
//    func getWeather(completion: @escaping (Result<weatherData, NetWorkError>) -> Void) {
//        guard let url = url else {
//            return completion(.failure(.badUrl))
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                return completion(.failure(.noData))
//            }
//
//            let weatherResponse = try?
//                JSONDecoder().decode(weatherData.self, from: data)
//            if let weatherResponse = weatherResponse {
//                completion(.success(weatherResponse))
//            } else {
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//    }
    

