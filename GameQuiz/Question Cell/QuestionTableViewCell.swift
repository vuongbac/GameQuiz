//
//  QuestionTableViewCell.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/6/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblQuestion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
