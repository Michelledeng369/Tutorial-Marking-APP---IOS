//studentindex
//  AddStudentViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/6.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit

class AddStudentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var student : Student?
    var studentIndex : Int? //used much later in tutorial
    var strBase64:String=""
    

    @IBOutlet var enterID: UITextField!
    @IBOutlet var enterName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func galleryButtonTapped(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            print("Gallery available")
            
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //Covert the image to base64 string so that it can be saved to database:"https://stackoverflow.com/questions/44780937/storing-and-retrieving-image-in-sqlite-with-swift"
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.editedImage.rawValue)] as? UIImage
        {
            imageView.image = image
            let imageData = image.jpegData(compressionQuality: 0)
            strBase64 = (imageData?.base64EncodedString(options: .lineLength64Characters))!
            dismiss(animated: true, completion: nil)
        }
        
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func onSave(_ sender: Any) {
        (sender as! UIBarButtonItem).title = "Loading..."
    
        
        let db = Firestore.firestore()
        let studentCollection = db.collection("students")

        var matrix = Student(
            studentId: Int32(enterID!.text!)!,
            studentName: enterName!.text!,
            photo: strBase64,
            week1Score: 0.0,
            week2Score: 0.0,
            week3Score: 0.0,
            week4Score: 0.0,
            week5Score: 0.0,
            week6Score: 0.0,
            week7Score: 0.0,
            week8Score: 0.0,
            week9Score: 0.0,
            week10Score: 0.0
            )
        do {
            var ref: DocumentReference? = nil
            try ref = studentCollection.addDocument(from: matrix, completion: { (err) in
                if let err = err {
                    print("Error adding document: \(err)")
                    
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                    matrix.id = ref!.documentID
                    students.append(matrix)
                    self.performSegue(withIdentifier: "saveSegue", sender: sender)
                }
            })
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
    }
    

}
