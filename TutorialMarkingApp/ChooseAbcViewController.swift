//
//  ChooseAbcViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/10.
//

import Firebase
import FirebaseFirestoreSwift
import UIKit

class ChooseAbcViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var student : Student?
    var studentIndex : Int?
    var selectedWeek: String?
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var curLabel: UILabel!
    @IBOutlet var gradeText: UITextField!
    
    @IBOutlet var photo: UIImageView!
    
    let grade = ["A", "B", "C", "D", "F"]
    var pickerView = UIPickerView()
    
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
        self.navigationItem.title = "Grade - \(selectedWeek!)"
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        gradeText.inputView = pickerView
        
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

        if (score == 100.0) {
            gradeText.text = "A"
            curLabel.text = "A"
        } else if (score == 80.0) {
            gradeText.text = "B"
            curLabel.text = "B"
        } else if (score == 70.0) {
            gradeText.text = "C"
            curLabel.text = "C"
        } else if (score == 60.0) {
            gradeText.text = "D"
            curLabel.text = "D"
        }else {
            gradeText.text = "F"
            curLabel.text = "F"
        }
        
   }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return grade.count
        }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return grade[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gradeText.text = grade[row]
        gradeText.resignFirstResponder()
    }
    
    
    var score = 0.00
    
    @IBAction func onSave(_ sender: Any) {
    var selectedgrade = gradeText.text
        
        let db = Firestore.firestore()
        switch selectedgrade {
        case "A":
            score = 100.0
        case "B":
            score = 80.0
        case "C":
            score = 70.0
        case "D":
            score = 60.0
        case "F":
            score = 0.0
        default:
            break
        }
        
        var updateScore = ""
        if (gradeText != nil) {
            
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
                try db.collection("students").document(student!.id!).updateData(["\(updateScore)": score]){ err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        switch self.selectedWeek {
                        case "Week 1":
                            students[self.studentIndex!].week1Score = self.score
                        case "Week 2":
                            students[self.studentIndex!].week2Score = self.score
                        case "Week 3":
                            students[self.studentIndex!].week3Score = self.score
                        case "Week 4":
                            students[self.studentIndex!].week4Score = self.score
                        case "Week 5":
                            students[self.studentIndex!].week5Score = self.score
                        case "Week 6":
                            students[self.studentIndex!].week6Score = self.score
                        case "Week 7":
                            students[self.studentIndex!].week7Score = self.score
                        case "Week 8":
                            students[self.studentIndex!].week8Score = self.score
                        case "Week 9":
                            students[self.studentIndex!].week9Score = self.score
                        case "Week 10":
                            students[self.studentIndex!].week10Score = self.score
                        default:
                            break
                        }
                        if (self.score == 100.0) {
                            self.curLabel.text = "A"
                        } else if (self.score == 80.0) {
                            self.curLabel.text = "B"
                        } else if (self.score == 70.0) {
                            self.curLabel.text = "C"
                        } else if (self.score == 60.0) {
                            self.curLabel.text = "D"
                        }else {
                            self.curLabel.text = "F"
                        }
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

