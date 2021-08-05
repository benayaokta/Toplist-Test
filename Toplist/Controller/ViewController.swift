//
//  ViewController.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 05/08/21.
//

import UIKit

class ViewController: UITableViewController {
    
    let rootVM = RootViewModel()
    
    @IBOutlet weak var refresher: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

    private func setup(){
        tableView.register(RootTableViewCell.registerNib(), forCellReuseIdentifier: RootTableViewCell.cellIdentifier)
        self.title = "Toplist"
        rootVM.fetchData()
    }

    @IBAction func refresh(_ sender: UIRefreshControl) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            sender.endRefreshing()
//        }
        print(#function)
    }
    
    
    //MARK: - Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    //MARK: - Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: NewsTableVC.segueIdentifier, sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewCell.cellIdentifier, for: indexPath) as! RootTableViewCell
        cell.symbolName.text = "BTC"
        cell.coinName.text = "Bitcoin"
        cell.currentPrice.text = "5000"
        cell.view.backgroundColor = .red
        cell.changeDay.text = "100"
        cell.changePercentage.text = "(+10%)"
        
        return cell
    }

    
}
