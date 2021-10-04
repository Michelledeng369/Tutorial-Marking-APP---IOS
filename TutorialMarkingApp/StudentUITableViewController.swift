//
//  StudentUITableViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/6.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit

var students = [Student]()


class StudentUITableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var searchStudent = [Student]()

    @IBOutlet var tableView: UITableView!
    @IBOutlet var search: UISearchBar!
    
    @IBAction func AddStudent(_ sender: Any) {
        self.performSegue(withIdentifier: "goToAddStudentScreen", sender: nil)
    }
    
    @IBAction func unwindToStudentList(sender: UIStoryboardSegue)
    {
        if let addScreen = sender.source as? AddStudentViewController
            {
                tableView.reloadData()
            }
        
        if let detailScreen = sender.source as? StudentDetailViewController
            {
                students[detailScreen.studentIndex!] = detailScreen.student!
                tableView.reloadData()
            }
        tableView.reloadData()
    }

    @IBAction func unwindToStudentListWithCancel(sender: UIStoryboardSegue)
    {
        tableView.reloadData()
    }
       

        override func viewDidLoad()
        {
                super.viewDidLoad()
            
            tableView.dataSource = self
            search.delegate = self
         
                
                let db = Firestore.firestore()
                let studentCollection = db.collection("students")
            
            
            studentCollection.getDocuments() { (result, err) in
                    if let err = err
                    {
                        print("Error getting documents: \(err)")
                    }
                    else
                    {
                        for document in result!.documents
                        {
                            let conversionResult = Result
                            {
                                try document.data(as: Student.self)
                            }
                            switch conversionResult
                            {
                                case .success(let convertedDoc):
                                    if var student = convertedDoc
                                    {
                                        // A `Student` value was successfully initialized from the DocumentSnapshot.
                                        student.id = document.documentID
                                        print("Student: \(student)")
                                        
                                        //NOTE THE ADDITION OF THIS LINE
                                        students.append(student)
                                    }
                                    else
                                    {
                                        // A nil value was successfully initialized from the DocumentSnapshot,
                                        // or the DocumentSnapshot was nil.
                                        print("Document does not exist")
                                    }
                                case .failure(let error):
                                    // A `Student` value could not be initialized from the DocumentSnapshot.
                                    print("Error decoding student: \(error)")
                            }
                        }
                        self.searchStudent = students
                        //NOTE THE ADDITION OF THIS LINE
                        self.tableView.reloadData()
                    }
                }
                
            }

        // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClasslistUITableViewCell", for: indexPath)

            //get the student for this row
            let student = searchStudent[indexPath.row]

            //down-cast the cell from UITableViewCell to our cell class StudentUITableViewCell
            //note, this could fail, so we use an if let.
            if let studentCell = cell as? ClasslistUITableViewCell
            {
                //populate the cell
                studentCell.idLabel.text = String(student.studentId!)
                studentCell.nameLabel.text = student.studentName
               
                if let photo = student.photo{
                    if photo != ""{
                        let decodedData = Data(base64Encoded: photo, options: .ignoreUnknownCharacters)
                        
                        let decodedimage:UIImage = UIImage(data: decodedData!)!
                        
                        studentCell.photo.image = decodedimage
                    }else {
                        studentCell.photo.image = UIImage(named: "icons8-winner-64")
                    }
                  
                }
               
            }

            return cell
        }
   //Search function achieved by source https://www.youtube.com/watch?v=iH67DkBx9Jc
    func searchBar (_ searchBar: UISearchBar, textDidChange searchText: String){

        if searchText == ""{
            searchStudent = students
        } else{
            searchStudent.removeAll()
            for student in students{
                if (student.studentName!.lowercased().contains(searchText.lowercased()) || String(student.studentId!).contains(searchText)) {
                    searchStudent.append(student)
                }
            }
        }
        self.tableView.reloadData()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        
        // is this the segue to the details screen? (in more complex apps, there is more than one segue per screen)
        if segue.identifier == "ShowStudentDetailSegue"
        {
              //down-cast from UIViewController to StudentDetailViewController (this could fail if we didn’t link things up properly)
              guard let detailViewController = segue.destination as? StudentDetailViewController else
              {
                  fatalError("Unexpected destination: \(segue.destination)")
              }

              //down-cast from UITableViewCell to StudentUITableViewCell (this could fail if we didn’t link things up properly)
              guard let selectedStudentCell = sender as? ClasslistUITableViewCell else
              {
                  fatalError("Unexpected sender: \( String(describing: sender))")
              }

              //get the number of the row that was pressed (this could fail if the cell wasn’t in the table but we know it is)
              guard let indexPath = tableView.indexPath(for: selectedStudentCell) else
              {
                  fatalError("The selected cell is not being displayed by the table")
              }

              //work out which student it is using the row number
              let selectedStudent = searchStudent[indexPath.row]
            
            

              //send it to the details screen
              detailViewController.student = selectedStudent
              detailViewController.studentIndex = indexPath.row
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        searchStudent = students
        self.tableView.reloadData()
    }
}


