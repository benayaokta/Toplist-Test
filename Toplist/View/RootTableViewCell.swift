//
//  RootTableViewCell.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 06/08/21.
//

import UIKit

class RootTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "rootCell"

    @IBOutlet weak var symbolName: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var changeDay: UILabel!
    @IBOutlet weak var changePercentage: UILabel!
    @IBOutlet weak var view: UIView!
    {
        didSet{
//            view.backgroundColor = .red
            view.layer.cornerRadius = 5
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func registerNib() -> UINib{
        return UINib(nibName: "RootTableViewCell", bundle: nil)
    }
    
}
