//
//  NewsDataResponse.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 07/08/21.
//

import Foundation

struct NewsDataResponse: Codable {
    let newsDataResponse: [NewsData]
    
    enum CodingKeys: String, CodingKey{
        case newsDataResponse = "Data"
    }
}

struct NewsData: Codable {
    let title:String
    let source: String
    let body: String
}
