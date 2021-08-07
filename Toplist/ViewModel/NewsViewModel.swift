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
            
            self.newsItem = newsDataResponse.newsDataResponse.map({ item in
                return NewsDataModel(title: item.title, source: item.source, summary: item.body)
            })
            
            
            self.delegate?.didFinishFetchNews(self.newsItem)
            
        } onFail: { error in
            print(String(describing: error))
        }

    }
    
}
