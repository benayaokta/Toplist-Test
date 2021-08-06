//
//  Response.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import Foundation


struct CryptoDataResponse:Decodable {
    let Data: [Data]
}

struct Data: Decodable {
    let CoinInfo : CoinInfo
    let DISPLAY : DisplayInfo?
}

struct DisplayInfo: Decodable {
    let USD : USD
}

struct CoinInfo:Decodable {
    let Name: String
    let FullName:String
}

struct USD: Decodable {
    let PRICE:String
    let CHANGEDAY : String
    let CHANGEPCTDAY :String
}
