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
    var body: body
    var header : header
}

struct header : Decodable {
    var resultMsg : String
    var resultCode : String
}

struct body : Decodable {
    var totalCount : Int
    var items : [items]?
    var pageNo: Int
    var numOfRows : Int
}

struct items : Decodable {
    var pm10Value : String?
    var pn10Grade : String?
    var sidoName : String?
    var pm25Value : String?
    var pm25Grade : String?
    
    var so2Grade : String?
    var khaiValue : String?
    var so2Value : String?
    var coValue : String?
    var o3Grade : String?
    var khaiGrade : String?
    var no2Grade : String?
    var dataTime: String?
    var coGrade : String?
    var no2Value : String?
    var stationName: String?
    var o3Value : String?
}
