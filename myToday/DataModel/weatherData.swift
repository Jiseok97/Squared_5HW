//
//  weatherData.swift
//  myToday
//
//  Created by 이지석 on 2021/07/26.
//

//struct weatherData : Decodable {
//    let timezone: String
//    let current: Current?
//}
//
//struct Current : Decodable {
//    let temp: Double?
//    let fells_like: Double?
//    let clouds: Int?
//    let wind_speed: Double?
//    let weather: [Weahter?]
//}
//
//struct Weahter : Decodable {
//    let main: String?
//    let description: String?
//    let icon: String?
//}


struct weatherData : Decodable {
    let weather: weather
    let main : main
    let name: String
}

struct weather : Decodable  {
    let main : String
    let descriptions: String
    let icon: String
}

struct main : Decodable {
    let temp: Int
    let temp_min : Int
    let temp_max : Int
}
