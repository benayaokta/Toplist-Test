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
    
    @IBOutlet weak var refresher: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

    private func setup(){
        tableView.register(RootTableViewCell.registerNib(), forCellReuseIdentifier: RootTableViewCell.cellIdentifier)
        self.title = "Toplist"
        rootVM.delegate = self
        rootVM.fetchData()
    }

    //MARK: - Belum kelar
    @IBAction func refresh(_ sender: UIRefreshControl) {
        sender.endRefreshing()
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

        let newsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: NewsTableVC.idenfitier) as! NewsTableVC
        newsVC.categories = items[indexPath.row].name
        self.present(newsVC, animated: true, completion: nil)
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

extension ViewController: RootViewModelDelegateOutput{
    func didFinishFetchingData(_ data: [CryptoDataModel]) {
        self.items = data
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
}
