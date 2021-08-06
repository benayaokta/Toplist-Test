//
//  NewsViewModelDelegateOutput.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 07/08/21.
//

import Foundation

protocol NewsViewModelDelegateOutput {
    func didFinishFetchNews(_ news:[NewsDataModel])
}
