//
//  ScoreUITableViewCell.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/10.
//

import UIKit

class ScoreUITableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
