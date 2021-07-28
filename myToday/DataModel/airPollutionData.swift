//
//  airPollution.swift
//  myToday
//
//  Created by 이지석 on 2021/07/29.
//

struct airPollutionData : Decodable {
    var response : response
}

struct response : Decodable {
    var item : [item]?
}

struct item : Decodable {
    var pm10Value : Int?
    var pn10Grade : Int?
    var sidoName : String?
    var pm25Value : Int?
    var pm25Grade : Int?
    
    var so2Grade : Int?
}
