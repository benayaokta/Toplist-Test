//
//  RootViewModel.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import Foundation

class RootViewModel {
    
    private let apiCall = APICall()
    
    
    func fetchData()
    {
        
        apiCall.fireHomepageURL { cryptoResponse in
            print(cryptoResponse)
        } onError: { err in
            print(err)
        }

    }
    
}
