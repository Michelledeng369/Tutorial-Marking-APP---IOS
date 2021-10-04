//
//  AttendanceViewController.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/8.
//
import Firebase
import FirebaseFirestoreSwift
import UIKit


class AttendanceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var weekText: UITextField!
    
    let week = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7", "Week 8", "Week 9", "Week 10"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        weekText.inputView = pickerView
    }
    
    //Source to achieve picker view: https://www.youtube.com/watch?v=FKuNwHZzJlA
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        
        // is this the segue to the details screen? (in more complex apps, there is more than one segue per screen)
        if segue.identifier == "ShowCheckSegue"
        {
              //down-cast from UIViewController to StudentDetailViewController (this could fail if we didn’t link things up properly)
            if let checkScreen = segue.destination as? CheckTableViewController
                    {
                        checkScreen.selectedWeek = weekText.text!
                    }
        }
        
        if segue.identifier == "ShowMultipleSegue"
        {
              //down-cast from UIViewController to StudentDetailViewController (this could fail if we didn’t link things up properly)
            if let multipleScreen = segue.destination as? MultipleTableViewController
                    {
                        multipleScreen.selectedWeek = weekText.text!
                    }
        }
        
        if segue.identifier == "ShowScoreSegue"
        {
              //down-cast from UIViewController to StudentDetailViewController (this could fail if we didn’t link things up properly)
            if let scoreScreen = segue.destination as? ScoreTableViewController
                    {
                        scoreScreen.selectedWeek = weekText.text!
                    }
        }
        
        if segue.identifier == "ShowHdSegue"
        {
              //down-cast from UIViewController to StudentDetailViewController (this could fail if we didn’t link things up properly)
            if let hdScreen = segue.destination as? GradeHdTableViewController
                    {
                        hdScreen.selectedWeek = weekText.text!
                    }
        }
        
        if segue.identifier == "ShowAbcSegue"
        {
              //down-cast from UIViewController to StudentDetailViewController (this could fail if we didn’t link things up properly)
            if let abcScreen = segue.destination as? GradeAbcTableViewController
                    {
                        abcScreen.selectedWeek = weekText.text!
                    }
        }
        
    }

    
    
    
}
