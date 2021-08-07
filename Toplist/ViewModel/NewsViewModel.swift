//
//  NewsViewModel.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 06/08/21.
//

import Foundation

class NewsViewModel {
    
    let apiCall = APICall()
    var newsItem = [NewsDataModel]()
    
    var delegate: NewsViewModelDelegateOutput?
    
    
    func searchNews(categories: String){
        apiCall.newsAPI(categories: categories) { [weak self] newsDataResponse in
            guard let self = self else {return}
            for element in newsDataResponse.newsDataResponse{
                self.newsItem.append(NewsDataModel(title: element.title, source: element.source, summary: element.body))
                self.delegate?.didFinishFetchNews(self.newsItem)
            }
        } onFail: { error in
            print(String(describing: error))
        }

    }
    
}
