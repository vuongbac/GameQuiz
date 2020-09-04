//
//  MenuViewController.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/3/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class MenuViewController: UIViewController {
    
    var email = ""
    @IBOutlet weak var lblEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblEmail.text = email
        
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        let LogOut = LoginManager()
        LogOut.logOut()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "main") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion:nil)
    }
    @IBAction func btnViewCategory(_ sender: Any) {
    }
    
    @IBAction func btnTakeTest(_ sender: Any) {
    }
    
    @IBAction func btnShowHistory(_ sender: Any) {
    }
}
