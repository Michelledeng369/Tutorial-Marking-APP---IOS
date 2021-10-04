//
//  StudentDetailViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/7.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit

class StudentDetailViewController: UIViewController {
    var student : Student?
    var studentIndex : Int? //used much later in tutorial
    
    @IBOutlet var idLabel: UITextField!
    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var week1: UILabel!
    @IBOutlet var week2: UILabel!
    @IBOutlet var week3: UILabel!
    @IBOutlet var week4: UILabel!
    @IBOutlet var week5: UILabel!
    @IBOutlet var week6: UILabel!
    @IBOutlet var week7: UILabel!
    @IBOutlet var week8: UILabel!
    @IBOutlet var week9: UILabel!
    @IBOutlet var week10: UILabel!
    @IBOutlet var photo: UIImageView!
    
    
    
    @IBAction func onSave(_ sender: Any) {
        (sender as! UIBarButtonItem).title = "Loading..."

            let db = Firestore.firestore()

            student!.studentId = Int32(idLabel.text!)!
            student!.studentName = nameLabel.text!
           
            do
            {
                //update the database (code from lectures)
                try db.collection("students").document(student!.id!).setData(from: student!){ err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                        //this code triggers the unwind segue manually
                        self.performSegue(withIdentifier: "saveSegue", sender: sender)
                    }
                }
            } catch { print("Error updating document \(error)") } //note "error" is a magic variable
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if let displayStudent = student
        {
         self.navigationItem.title = displayStudent.studentName //this awesome line sets the page title
            idLabel.text = String(displayStudent.studentId!)
            nameLabel.text = displayStudent.studentName
            week1.text = String(displayStudent.week1Score!)
            week2.text = String(displayStudent.week2Score!)
            week3.text = String(displayStudent.week3Score!)
            week4.text = String(displayStudent.week4Score!)
            week5.text = String(displayStudent.week5Score!)
            week6.text = String(displayStudent.week6Score!)
            week7.text = String(displayStudent.week7Score!)
            week8.text = String(displayStudent.week8Score!)
            week9.text = String(displayStudent.week9Score!)
            week10.text = String(displayStudent.week10Score!)
            
            if let photo = displayStudent.photo{
                if photo != ""{
                    let decodedData = Data(base64Encoded: photo, options: .ignoreUnknownCharacters)
                    
                    let decodedimage:UIImage = UIImage(data: decodedData!)!
                    
                    self.photo.image = decodedimage
                }
              
            }
            
        }
    }
    
    
    @IBAction func onDelete(_ sender: Any) {
        
        let db = Firestore.firestore()
        //Source to achieve alert: https://learnappmaking.com/uialertcontroller-alerts-swift-how-to/
        let alert = UIAlertController(title: "DELETE Warning", message: "Are you sure to DELETE this student?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                db.collection("students").document(self.student!.id!).delete(){
                    err in
                    if let err = err {
                       print("Error updating document: \(err)")
                    } else {
                        students.remove(at: self.studentIndex!)
                        self.performSegue(withIdentifier: "cancelSegue", sender: sender)
                   }
                }}))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)       
    }
    
    @IBAction func onShare(_ sender: Any) {
        let shareViewController = UIActivityViewController(activityItems: ["ID: \(String((student?.studentId!)!)), Name: \(String((student?.studentName!)!)), Week 1: \(String((student?.week1Score!)!)), Week 2: \(String((student?.week2Score!)!)), Week 3: \(String((student?.week3Score!)!)), Week 4: \(String((student?.week4Score!)!)), Week 5: \(String((student?.week5Score!)!)), Week 6: \(String((student?.week6Score!)!)), Week 7: \(String((student?.week7Score!)!)), Week 8: \(String((student?.week8Score!)!)), Week 9: \(String((student?.week9Score!)!)), Week 10: \(String((student?.week10Score!)!))."], applicationActivities: [])
        shareViewController.excludedActivityTypes = [UIActivity.ActivityType.postToFacebook]
        present(shareViewController, animated: true, completion: nil)
    }
    
   

}
