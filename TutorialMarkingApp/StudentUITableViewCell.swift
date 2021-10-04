//
//  StudentUITableViewCell.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/6.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit

class StudentUITableViewCell: UITableViewCell {
    var selectedWeek: String?
    var student : Student?
    var studentIndex : Int?
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var photo: UIImageView!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
