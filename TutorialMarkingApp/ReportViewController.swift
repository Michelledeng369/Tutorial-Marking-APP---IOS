//
//  ReportViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/10.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit

class ReportViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var student : Student?
    var studentIndex : Int?
    var selectedWeek: String?
    
    
    @IBOutlet var tableReport: UITableView!
    @IBOutlet var weekText: UITextField!
    @IBOutlet var averageLabel: UILabel!
    
    
    
    let week = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7", "Week 8", "Week 9", "Week 10"]
    var pickerView = UIPickerView()
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return week.count
        }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return week[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weekText.text = week[row]
        weekText.resignFirstResponder()
        
        var scores = 0.0
        var sweek = week[row]
        for student in students {
            switch sweek {
            case "Week 1":
                scores = scores + student.week1Score!
            case "Week 2":
                scores = scores + student.week2Score!
            case "Week 3":
                scores = scores + student.week3Score!
            case "Week 4":
                scores = scores + student.week4Score!
            case "Week 5":
                scores = scores + student.week5Score!
            case "Week 6":
                scores = scores + student.week6Score!
            case "Week 7":
                scores = scores + student.week7Score!
            case "Week 8":
                scores = scores + student.week8Score!
            case "Week 9":
                scores = scores + student.week9Score!
            case "Week 10":
                scores = scores + student.week10Score!
            default:
                break
            }
        }
       
        
        averageLabel.text = String(scores / Double(students.count))
        
        tableReport.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        tableReport.dataSource = self
        
        weekText.inputView = pickerView
        
        var scores = 0.0
        for student in students {
            scores = scores + student.week1Score!
        }
        averageLabel.text = String(scores / Double(students.count))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreUITableViewCell", for: indexPath)

        //get the student for this row
        let student = students[indexPath.row]

        
        if let studentCell = cell as? ScoreUITableViewCell
        {
            //populate the cell
            
            studentCell.nameLabel.text = student.studentName
            
            var score = 0.0
            let selectedWeek = weekText.text
            switch selectedWeek {
            case "Week 1":
                score = student.week1Score!
            case "Week 2":
                score = student.week2Score!
            case "Week 3":
                score = student.week3Score!
            case "Week 4":
                score = student.week4Score!
            case "Week 5":
                score = student.week5Score!
            case "Week 6":
                score = student.week6Score!
            case "Week 7":
                score = student.week7Score!
            case "Week 8":
                score = student.week8Score!
            case "Week 9":
                score = student.week9Score!
            case "Week 10":
                score = student.week10Score!
            default:
                break
            }
            //studentCell.scoreLabel.isHidden = false
            studentCell.scoreLabel.text = String(score)
        }

        return cell
    }
   
    override func viewWillAppear(_ animated: Bool) {
        
        var scores = 0.0
        selectedWeek = weekText.text
        for student in students {
            switch selectedWeek {
            case "Week 1":
                scores = scores + student.week1Score!
            case "Week 2":
                scores = scores + student.week2Score!
            case "Week 3":
                scores = scores + student.week3Score!
            case "Week 4":
                scores = scores + student.week4Score!
            case "Week 5":
                scores = scores + student.week5Score!
            case "Week 6":
                scores = scores + student.week6Score!
            case "Week 7":
                scores = scores + student.week7Score!
            case "Week 8":
                scores = scores + student.week8Score!
            case "Week 9":
                scores = scores + student.week9Score!
            case "Week 10":
                scores = scores + student.week10Score!
            default:
                break
            }
        }
        averageLabel.text = String(scores / Double(students.count))
        self.tableReport.reloadData()
    }
}
