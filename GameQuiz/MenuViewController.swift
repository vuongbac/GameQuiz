//
//  MenuViewController.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/3/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var email = ""

    @IBOutlet weak var lblEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblEmail.text = email

    }
    
    @IBAction func btnViewCategory(_ sender: Any) {
    }
    
    @IBAction func btnTakeTest(_ sender: Any) {
    }
    
    @IBAction func btnShowHistory(_ sender: Any) {
    }
}
