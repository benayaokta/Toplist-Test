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
//                            print(successResponse.Data[0].CoinInfo.Name)
                            onCompletion(successResponse)
                        case .failure (let error):
                            onError(error as NSError)
                        }
                }
        
        
        
        
    }
    
//    func nembakAPI(completionHandler: @escaping ([CryptoDataModel]) -> ()){
//        var data = [CryptoDataModel]()
//        
//        AF.request("\(baseURL)\(top50URL)")
//            .validate()
//            .responseJSON { response in
//                let decoder = JSONDecoder()
//                do{
//                    let decodedJSON = decoder.decode(CryptoDataResponse.self, from: response)
//                    let temp = decodedJSON[].da
//                    
//                }catch{
//                    
//                }
//                
//            }
//        
//        completionHandler(data)
//    }
    
    func newsAPI(categories: String, onComplete: @escaping () -> (), onFail: @escaping (NSError) -> () ){
        
    }
    
    
}
