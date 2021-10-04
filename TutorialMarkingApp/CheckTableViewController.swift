//
//  CheckTableViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/8.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit


class CheckTableViewController: UITableViewController {
    var student : Student?
    var studentIndex : Int?
    var selectedWeek: String?
   
    override func viewDidLoad()
    {
            super.viewDidLoad()
       
        self.navigationItem.title = "Check \(selectedWeek!)"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckUITableViewCell", for: indexPath)

        //get the student for this row
        let student = students[indexPath.row]

        //down-cast the cell from UITableViewCell to our cell class StudentUITableViewCell
        //note, this could fail, so we use an if let.
        
        
        if let studentCell = cell as? CheckUITableViewCell
        {
            //populate the cell
            studentCell.idLabel.text = String(student.studentId!)
            studentCell.nameLabel.text = student.studentName!
            studentCell.selectedWeek = selectedWeek
            studentCell.student = student
            studentCell.studentIndex = indexPath.row
            
            if let photo = student.photo{
                if photo != ""{
                    let decodedData = Data(base64Encoded: photo, options: .ignoreUnknownCharacters)
                    
                    let decodedimage:UIImage = UIImage(data: decodedData!)!
                    
                    studentCell.photo.image = decodedimage
                }              
            }
            
            var score = 0.0
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
            
            if (score == 100.0) {
                studentCell.checkSwitch.isOn = true
            } else {
                studentCell.checkSwitch.isOn = false
            }
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}

