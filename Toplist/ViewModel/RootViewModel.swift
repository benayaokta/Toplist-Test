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
        
            self.cryptoData = cryptoResponse.dataResponse.compactMap({ cryptoItem in
                if let price = cryptoItem.display?.usd.price,
                   let changeDay = cryptoItem.display?.usd.changeDay,
                   let changePercentage = cryptoItem.display?.usd.changePercentageDay{
                    
                    return CryptoDataModel(name: cryptoItem.coinInfo.name,
                                    fullname: cryptoItem.coinInfo.fullName,
                                    price: price,
                                    changeDay:  changeDay,
                                    changePercentageDay: changePercentage)
                }
                return nil
            })
            
            self.delegate?.didFinishFetchingData(self.cryptoData)
        } onError: { err in
            self.delegate?.errorFound(err)
        }
    }
    
}
