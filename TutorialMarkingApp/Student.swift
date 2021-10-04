//
//  Student.swift
//  TutorialMarkingApp
//
//  Created by Minxi Deng on 2021/5/6.
//

import Firebase
import FirebaseFirestoreSwift

public struct Student : Codable
{
    @DocumentID var id:String?
    var studentId:Int32?
    var studentName:String?
    var photo:String?
    
    var week1Score:Double?
    var week2Score:Double?
    var week3Score:Double?
    var week4Score:Double?
    var week5Score:Double?
    var week6Score:Double?
    var week7Score:Double?
    var week8Score:Double?
    var week9Score:Double?
    var week10Score:Double?
}
