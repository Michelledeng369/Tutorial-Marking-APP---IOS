//
//  CheckUITableViewCell.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/9.
//


import Firebase
import FirebaseFirestoreSwift
import UIKit

class CheckUITableViewCell: UITableViewCell {
    var selectedWeek: String?
    var student : Student?
    var studentIndex : Int?

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var photo: UIImageView!
    
    @IBOutlet var checkSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onSwitch(_ sender: Any) {
    let db = Firestore.firestore()
    var updateScore = ""
    if ((sender as AnyObject).isOn == true) {
        
        switch selectedWeek {
        case "Week 1":
            updateScore = "week1Score"
        case "Week 2":
            updateScore = "week2Score"
        case "Week 3":
            updateScore = "week3Score"
        case "Week 4":
            updateScore = "week4Score"
        case "Week 5":
            updateScore = "week5Score"
        case "Week 6":
            updateScore = "week6Score"
        case "Week 7":
            updateScore = "week7Score"
        case "Week 8":
            updateScore = "week8Score"
        case "Week 9":
            updateScore = "week9Score"
        case "Week 10":
            updateScore = "week10Score"
        default:
            break
        }
        
        do
        {
            //update the database (code from lectures)
            try db.collection("students").document(student!.id!).updateData(["\(updateScore)": 100.0]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    switch self.selectedWeek {
                    case "Week 1":
                        students[self.studentIndex!].week1Score = 100.0
                    case "Week 2":
                        students[self.studentIndex!].week2Score = 100.0
                    case "Week 3":
                        students[self.studentIndex!].week3Score = 100.0
                    case "Week 4":
                        students[self.studentIndex!].week4Score = 100.0
                    case "Week 5":
                        students[self.studentIndex!].week5Score = 100.0
                    case "Week 6":
                        students[self.studentIndex!].week6Score = 100.0
                    case "Week 7":
                        students[self.studentIndex!].week7Score = 100.0
                    case "Week 8":
                        students[self.studentIndex!].week8Score = 100.0
                    case "Week 9":
                        students[self.studentIndex!].week9Score = 100.0
                    case "Week 10":
                        students[self.studentIndex!].week10Score = 100.0
                    default:
                        break
                    }
                    //print("Document successfully updated")
                }
            }
        } catch { print("Error updating document \(error)") }
    }else {
        switch selectedWeek {
        case "Week 1":
            updateScore = "week1Score"
        case "Week 2":
            updateScore = "week2Score"
        case "Week 3":
            updateScore = "week3Score"
        case "Week 4":
            updateScore = "week4Score"
        case "Week 5":
            updateScore = "week5Score"
        case "Week 6":
            updateScore = "week6Score"
        case "Week 7":
            updateScore = "week7Score"
        case "Week 8":
            updateScore = "week8Score"
        case "Week 9":
            updateScore = "week9Score"
        case "Week 10":
            updateScore = "week10Score"
        default:
            break
        }
        
        do
        {
            //update the database (code from lectures)
            try db.collection("students").document(student!.id!).updateData(["\(updateScore)": 0.0]){ err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    switch self.selectedWeek {
                    case "Week 1":
                        students[self.studentIndex!].week1Score = 0.0
                    case "Week 2":
                        students[self.studentIndex!].week2Score = 0.0
                    case "Week 3":
                        students[self.studentIndex!].week3Score = 0.0
                    case "Week 4":
                        students[self.studentIndex!].week4Score = 0.0
                    case "Week 5":
                        students[self.studentIndex!].week5Score = 0.0
                    case "Week 6":
                        students[self.studentIndex!].week6Score = 0.0
                    case "Week 7":
                        students[self.studentIndex!].week7Score = 0.0
                    case "Week 8":
                        students[self.studentIndex!].week8Score = 0.0
                    case "Week 9":
                        students[self.studentIndex!].week9Score = 0.0
                    case "Week 10":
                        students[self.studentIndex!].week10Score = 0.0
                    default:
                        break
                    }
                    //print("Document successfully updated")
                }
            }
        } catch { print("Error updating document \(error)") }
    }
    
}

}

