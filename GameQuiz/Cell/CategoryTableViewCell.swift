//
//  CategoryTableViewCell.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/3/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNameCategory: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func btnViewQuetion(_ sender: Any) {
        
    }
    @IBAction func btnPlay(_ sender: Any) {
        
    }
    
//    func setUp(data: CategoryModel) {
//        lblNameCategory.text = data.nameCategory
//    }

}
