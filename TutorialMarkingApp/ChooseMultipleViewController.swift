//
//  ChooseMultipleViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/10.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit

class ChooseMultipleViewController: UIViewController {
    var student : Student?
    var studentIndex : Int?
    var selectedWeek: String?

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var curLabel: UILabel!
    @IBOutlet var task1: UISwitch!
    @IBOutlet var task2: UISwitch!
    
    @IBOutlet var photo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let displayStudent = student
        {
        //this awesome line sets the page title
            idLabel.text = String(displayStudent.studentId!)
            nameLabel.text = displayStudent.studentName
            if let photo = displayStudent.photo{
                if photo != ""{
                    let decodedData = Data(base64Encoded: photo, options: .ignoreUnknownCharacters)
                    
                    let decodedimage:UIImage = UIImage(data: decodedData!)!
                    
                    self.photo.image = decodedimage
                }
              
            }
            
        }
        self.navigationItem.title = "Multiple - \(selectedWeek!)"
        
        var score = 0.0
        switch selectedWeek {
        case "Week 1":
            score = students[self.studentIndex!].week1Score!
        case "Week 2":
            score = students[self.studentIndex!].week2Score!
        case "Week 3":
            score = students[self.studentIndex!].week3Score!
        case "Week 4":
            score = students[self.studentIndex!].week4Score!
        case "Week 5":
            score = students[self.studentIndex!].week5Score!
        case "Week 6":
            score = students[self.studentIndex!].week6Score!
        case "Week 7":
            score = students[self.studentIndex!].week7Score!
        case "Week 8":
            score = students[self.studentIndex!].week8Score!
        case "Week 9":
            score = students[self.studentIndex!].week9Score!
        case "Week 10":
            score = students[self.studentIndex!].week10Score!
        default:
            break
        }
        
        curLabel.text = String(score)
        
    }
    

    @IBAction func onSave(_ sender: Any) {
        let db = Firestore.firestore()
        var updateScore = ""
        if (task1.isOn == true && task2.isOn == true) {
            
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
                        self.curLabel.text = String(100.0)
                    }
                }
            } catch { print("Error updating document \(error)") }
        } else if (task1.isOn == true || task2.isOn == true) {
            
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
                try db.collection("students").document(student!.id!).updateData(["\(updateScore)": 50.0]){ err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        switch self.selectedWeek {
                        case "Week 1":
                            students[self.studentIndex!].week1Score = 50.0
                        case "Week 2":
                            students[self.studentIndex!].week2Score = 50.0
                        case "Week 3":
                            students[self.studentIndex!].week3Score = 50.0
                        case "Week 4":
                            students[self.studentIndex!].week4Score = 50.0
                        case "Week 5":
                            students[self.studentIndex!].week5Score = 50.0
                        case "Week 6":
                            students[self.studentIndex!].week6Score = 50.0
                        case "Week 7":
                            students[self.studentIndex!].week7Score = 50.0
                        case "Week 8":
                            students[self.studentIndex!].week8Score = 50.0
                        case "Week 9":
                            students[self.studentIndex!].week9Score = 50.0
                        case "Week 10":
                            students[self.studentIndex!].week10Score = 50.0
                        default:
                            break
                        }
                        self.curLabel.text = String(50.0)
                    }
                }
            } catch { print("Error updating document \(error)") }
        } else {
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
