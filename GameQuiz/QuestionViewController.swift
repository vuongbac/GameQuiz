//
//  QuestionViewController.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/6/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class QuestionViewController: UIViewController {
    var questions = [Question]()
    var questionByCate = [Question]()
    var cateid = 0
    @IBOutlet weak var tableView: UITableView!
    var ref = Database.database().reference()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
retrieveDataQuestion()
    }
    
    func retrieveDataQuestion(){
        ref.child("Question").observeSingleEvent(of: .value) {[weak self] (snapshot) in
            guard let self = self else {
                return
            }
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    print(snap.key)
                    if let value = snap.value as? [String : Any] {
                        let questionid = value["Id"] as? Int
                        let categoryid = value["CategoryId"] as? Int
                        let content = value["Content"] as? String
                        let trueAns = value["trueAns"] as? String
                        let falseAns1 = value["falseAns1"] as? String
                        let falseAns2 = value["falseAns2"] as? String
                        let falseAns3 = value["falseAns3"] as? String
                        let question = Question(questionid: questionid!, categoryid: categoryid!, content: content!, trueAns: trueAns!, falseAns1: falseAns1!, falseAns2: falseAns2!, falseAns3: falseAns3!)
                        if question.categoryid == self.cateid {
                            self.questions.append(question)
                        }
                    }
                }
                print(self.questions.count)
                self.tableView.reloadData()
            }
        }
    }
    
    

}
