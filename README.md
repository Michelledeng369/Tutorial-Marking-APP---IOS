# Tutorial-Marking-APP---IOS

How to run this application?
Step 1. Dowload XCode in your Macbook.
Step 2. Dowload "Tutorial-Marking-APP---IOS" project, double click "TutorialMarkingApp.xcworkspace" file and open it by XCode.
Step 3. Choose one simulation you like, and click "Run" button on Xcode.
Just waitting for the open of the App!


This is a Tutorial Marks App developed by Xcode with Swift language. 

The application has three sections: 
1. Classlist - mainly used for student management (student addition, editing, deletion, and view and share students’ details); 
2. Attendance - this section is to mark the student’s performance on the tutorial with 5 marking schemes: a. checkbox attendance; b. multiple checkpoints (2 checkpoints); c. enter score out of 100; d. Grade level (HD+/HD/DN/CR/PP/NN), and f. Grade Level (A/B/C/D/F), only one scheme can be used each week; 
3. Report - shows the grades of all students according to the week with the average score. The development of the application follows usability goals and design principles, which can basically meet tutor's marking requirements on the tutorial.
4. Use Firebase as the database.


There is some error in search button!
The search function is achieved but it cannot be associated with the studentInsex in StudentDetailViewController. It uses a temporary variable "searchStudent" to store the student details after searching. However, there is a bug, that is, the app cannot return the right student after filtering, for example, if I filter a keyword and get 3 students, when I change the third student’s (e.g. Mike is the third student after  filtering) name and return to student list, the third student’s (Tim is the student in student list) name in student list will be changed. I know the problem is because of the studentIndex.

If you can fix it, thank you a lot!
