//
//  APICall.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import Foundation
import Alamofire

struct APICall {
    let top50URL = "https://min-api.cryptocompare.com/data/top/totaltoptiervolfull?limit=50&tsym=USD"
    let newsURL = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN"
    
    func fireHomepageURL(completionHandlet: @escaping (CryptoData) -> ()){
        AF.request(top50URL).responseJSON { response in
            print(response.result)
        }
        
    }
}
