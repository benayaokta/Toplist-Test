//
//  Response.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import Foundation


struct CryptoDataResponse:Decodable {
    let dataResponse: [Data]
    
    enum CodingKeys: String, CodingKey {
        case dataResponse = "Data"
    }
}

struct Data: Codable {
    let coinInfo : CoinInfo
    let display : DisplayInfo?
    
    enum CodingKeys: String,CodingKey{
        case coinInfo = "CoinInfo"
        case display = "DISPLAY"
    }
}

struct DisplayInfo: Codable {
    let usd : USD
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct CoinInfo:Codable {
    let name: String
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case fullName = "FullName"
    }
}

struct USD: Codable {
    let price:String
    let changeDay : String
    let changePercentageDay :String
    
    enum CodingKeys: String,CodingKey {
        case price = "PRICE"
        case changeDay = "CHANGEDAY"
        case changePercentageDay = "CHANGEPCTDAY"
    }
}
