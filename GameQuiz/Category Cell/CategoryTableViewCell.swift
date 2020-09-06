//
//  CategoryTableViewCell.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/5/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit
import SDWebImage

protocol CategoryDelegate: AnyObject {
    func didTapButton(with title: String, cateid:Int )
    
    
}

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var backgrond: UIImageView!
    @IBOutlet weak var btnListQuetion: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
    var cateid:Int = 0
    var delegate: CategoryDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgrond.layer.cornerRadius = 10
        btnPlay.layer.cornerRadius = 20
        btnListQuetion.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btnListQuestion(_ sender: Any) {
        delegate?.didTapButton(with: "View", cateid: cateid)
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        delegate?.didTapButton(with: "Play", cateid: cateid)

    }
    
    func setUp(data:Category){
        lblName.text = data.name
        backgrond.sd_setImage(with:URL(string: data.image ))
    }
    
}
