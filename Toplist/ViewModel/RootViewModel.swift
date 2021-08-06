//
//  RootViewModel.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import Foundation

class RootViewModel {
    
    private let apiCall = APICall()
    var cryptoData = [CryptoDataModel]()
    
    var delegate: RootViewModelDelegate?
    
    
    func fetchData()
    {
        
        apiCall.fireHomepageURL { [weak self] cryptoResponse in

            guard let self = self else {return}
            for element in cryptoResponse.Data{
                
                if let changeDay = element.DISPLAY?.USD.CHANGEDAY, let changePercentage = element.DISPLAY?.USD.CHANGEPCTDAY, let currentPrice = element.DISPLAY?.USD.PRICE{
                    self.cryptoData.append(CryptoDataModel(name: element.CoinInfo.Name, fullname: element.CoinInfo.FullName, price: currentPrice, changeDay: changeDay, changePercentageDay: changePercentage))
                }
                
            }
            
            self.delegate?.didFinishFetchingData(self.cryptoData)
//            print(self.cryptoData)

        } onError: { err in
            print(err)
        }


    }
    
}
