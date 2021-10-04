//
//  GradeAbcTableViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/9.
//

import UIKit

class GradeAbcTableViewController: UITableViewController {
    var student : Student?
    var studentIndex : Int?
    var selectedWeek: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentUITableViewCell", for: indexPath)

        //get the student for this row
        let student = students[indexPath.row]

        //down-cast the cell from UITableViewCell to our cell class StudentUITableViewCell
        //note, this could fail, so we use an if let.
        if let studentCell = cell as? StudentUITableViewCell
        {
            //populate the cell
            studentCell.idLabel.text = String(student.studentId!)
            studentCell.nameLabel.text = student.studentName
            
            if let photo = student.photo{
                if photo != ""{
                    let decodedData = Data(base64Encoded: photo, options: .ignoreUnknownCharacters)
                    
                    let decodedimage:UIImage = UIImage(data: decodedData!)!
                    
                    studentCell.photo.image = decodedimage
                }
              
            }
        }

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        
        // is this the segue to the details screen? (in more complex apps, there is more than one segue per screen)
        if segue.identifier == "ShowChooseAbcSegue"
        {
              //down-cast from UIViewController to StudentDetailViewController (this could fail if we didn’t link things up properly)
            if let choosehdScreen = segue.destination as? ChooseAbcViewController
                    {
                      choosehdScreen.selectedWeek = selectedWeek!
                    }
            
            //down-cast from UIViewController to StudentDetailViewController (this could fail if we didn’t link things up properly)
            guard let detailViewController = segue.destination as? ChooseAbcViewController else
            {
                fatalError("Unexpected destination: \(segue.destination)")
            }

            //down-cast from UITableViewCell to StudentUITableViewCell (this could fail if we didn’t link things up properly)
            guard let selectedStudentCell = sender as? StudentUITableViewCell else
            {
                fatalError("Unexpected sender: \( String(describing: sender))")
            }

            //get the number of the row that was pressed (this could fail if the cell wasn’t in the table but we know it is)
            guard let indexPath = tableView.indexPath(for: selectedStudentCell) else
            {
                fatalError("The selected cell is not being displayed by the table")
            }

            //work out which student it is using the row number
            let selectedStudent = students[indexPath.row]

            //send it to the details screen
            detailViewController.student = selectedStudent
            detailViewController.studentIndex = indexPath.row
            
      }
        tableView.reloadData()
    }
    
}
