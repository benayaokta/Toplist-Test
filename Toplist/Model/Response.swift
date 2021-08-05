//
//  Response.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import Foundation

struct Response:Decodable {
    let coinInfo : CoinInfo
    let displayInfo : DisplayInfo
}

struct CoinInfo:Decodable {
    let name: String
    let fullname:String
}

struct DisplayInfo: Decodable {
    let usd : USD
}

struct USD: Decodable {
    let price:String
    let CHANGEDAY : String
    let CHANGEPCTDAY :String
    
}
