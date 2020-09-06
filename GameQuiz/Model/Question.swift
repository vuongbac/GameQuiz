//
//  Question.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/6/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation

struct Question: Codable {
    var questionid: Int
    var categoryid: Int
    var content: String
    var trueAns: String
    var falseAns1: String
    var falseAns2: String
    var falseAns3: String
    
    
    init(questionid: Int,categoryid: Int, content: String,trueAns: String,falseAns1: String,falseAns2: String,falseAns3: String) {
        self.questionid = questionid
        self.categoryid = categoryid
        self.content = content
        self.trueAns = trueAns
        self.falseAns1 = falseAns1
        self.falseAns2 = falseAns2
        self.falseAns3 = falseAns3
    }
}
