//
//  ViewController.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import UIKit

class ViewController: UITableViewController {
    
    let rootVM = RootViewModel()
    var items = [CryptoDataModel]()
    var selectedItem = ""
    
    @IBOutlet weak var refresher: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

    private func setup(){
        refresher.beginRefreshing()
        tableView.register(RootTableViewCell.registerNib(), forCellReuseIdentifier: RootTableViewCell.cellIdentifier)
        self.title = "Toplist"
        rootVM.delegate = self
        rootVM.fetchData()
    }

    //MARK: - Pull to Refresh
    @IBAction func refresh(_ sender: UIRefreshControl) {
        rootVM.fetchData()
    }
    
    //MARK: - Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    //MARK: - Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let newsNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "newsNavBar") as! UINavigationController
        
        let newsVC = newsNavigationController.topViewController as! NewsTableVC

        newsVC.categories = items[indexPath.row].name
        
        self.present(newsNavigationController, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewCell.cellIdentifier, for: indexPath) as! RootTableViewCell

        let itemCell = items[indexPath.row]
        
        cell.symbolName.text = itemCell.name
        cell.coinName.text = itemCell.fullname
        cell.currentPrice.text = itemCell.price
        cell.changeDay.text = itemCell.changeDay
        cell.changePercentage.text = "("+itemCell.changePercentageDay+"%)"
        cell.configureBackgroundView(s: itemCell.changePercentageDay)

        return cell
    }
    
}


//MARK: - Extension
extension ViewController: RootViewModelDelegateOutput{
    func errorFound(_ error: NSError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel,handler: { _ in
            self.rootVM.fetchData()
        }))
        self.present(alert, animated: true)
    }
    
    func didFinishFetchingData(_ data: [CryptoDataModel]) {
        self.items = data
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
            refresher.endRefreshing()
        }
    }
}
