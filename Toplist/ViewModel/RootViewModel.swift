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
    
    var delegate: RootViewModelDelegateOutput?
    
    func fetchData()
    {
        apiCall.fireHomepageURL { [weak self] cryptoResponse in
            guard let self = self else {return}
            
            for element in cryptoResponse.dataResponse{
                
                if let changeDay = element.display?.usd.changeDay, let changePercentage = element.display?.usd.changePercentageDay, let currentPrice = element.display?.usd.price{
                    self.cryptoData.append(CryptoDataModel(name: element.coinInfo.name, fullname: element.coinInfo.fullName, price: currentPrice, changeDay: changeDay, changePercentageDay: changePercentage))
                }
            }
            self.delegate?.didFinishFetchingData(self.cryptoData)
        } onError: { err in
            print(err)
        }
    }
}
