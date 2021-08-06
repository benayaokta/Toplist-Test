//
//  NewsTableViewCell.swift
//  Toplist
//
//  Created by Benaya Oktavianus on 06/08/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let cellIdentifier = "newsCell"

    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsHeadline: UILabel!
    @IBOutlet weak var newsSummary: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func register() -> UINib{
        return UINib(nibName: "NewsTableViewCell", bundle: nil)
    }
    
}
