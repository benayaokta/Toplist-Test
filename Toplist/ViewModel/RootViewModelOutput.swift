//
//  RootViewModelOutput.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 06/08/21.
//

protocol RootViewModelDelegate {
    func didFinishFetchingData(_ data: [CryptoDataModel])
}
