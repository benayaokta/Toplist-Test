//
//  NewsTableVC.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import UIKit

class NewsTableVC: UITableViewController {
    
    static let segueIdentifier = "toNewsTableView"
    static let idenfitier = "NewsTableVC"
    
    let newsVM = NewsViewModel()
    
    var newsItem = [NewsDataModel]()
    var categories = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        newsVM.searchNews(categories: categories)

    }
    
    deinit {
        categories = ""
        print(categories)
    }
    
    private func setup(){
        self.title = "News"
        tableView.register(NewsTableViewCell.register(), forCellReuseIdentifier: NewsTableViewCell.cellIdentifier)
        newsVM.delegate = self
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItem.count
    }
    
    // MARK: - Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.cellIdentifier, for: indexPath) as! NewsTableViewCell
        
        let newsItem = newsItem[indexPath.row]

        cell.newsSource.text = newsItem.source
        cell.newsHeadline.text = newsItem.title
        cell.newsSummary.text = newsItem.summary

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

}

extension NewsTableVC: NewsViewModelDelegateOutput{
    func didFinishFetchNews(_ news: [NewsDataModel]) {
        self.newsItem = news
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }

}
