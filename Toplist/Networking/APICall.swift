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
    let newsURL = "/v2/news/?lang=EN&categories="
    
    func fireHomepageURL(onCompletion: @escaping (CryptoDataResponse) -> (), onError: @escaping (NSError) -> ())
    {
        AF.request("\(baseURL)\(top50URL)")
            .validate()
            .responseDecodable(of: CryptoDataResponse.self) { response in
                
                switch response.result{
                case .success (let successResponse):
                    onCompletion(successResponse)
                case .failure (let error):
                    onError(error as NSError)
                }
            }
    }
    
    func newsAPI(categories: String, onComplete: @escaping (NewsDataResponse) -> (), onFail: @escaping (NSError) -> () ){
        AF.request("\(baseURL)\(newsURL)\(categories)")
            .validate()
            .responseDecodable(of: NewsDataResponse.self) { response in
                switch response.result{
                case .success(let success):
                    onComplete(success)
                case .failure(let error):
                    onFail(error as NSError)
                }
            }
    }
    
    
}
