//
//  RootViewModelOutput.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 06/08/21.
//
import Foundation

protocol RootViewModelDelegateOutput {
    func didFinishFetchingData(_ data: [CryptoDataModel])
    func errorFound(_ error: NSError)
}
