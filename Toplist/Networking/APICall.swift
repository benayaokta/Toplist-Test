//
//  APICall.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import Foundation
import Alamofire


struct APICall {
    let baseURL = "https://min-api.cryptocompare.com/data"
    let top50URL = "/top/totaltoptiervolfull?limit=50&tsym=USD"
    let newsURL = "/v2/news/?lang=EN"
    
    
    
    
    func fireHomepageURL(onCompletion: @escaping (CryptoDataResponse) -> (), onError: @escaping (NSError) -> ())
    {
        AF.request("\(baseURL)\(top50URL)")
            .validate()
            .responseDecodable(of: CryptoDataResponse.self) { response in
                
                switch response.result{
                case .success:
                    if let safeResponse = response.value{
                        onCompletion(safeResponse)
                    }
                case .failure (let error):
                    onError(error as NSError)
                }
        }
    }
}
