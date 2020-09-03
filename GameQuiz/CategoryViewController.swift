//
//  CategoryViewController.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/3/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAnalytics

class CategoryViewController: UIViewController {
    let privateIdentifier = "CategoryTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    
    var categorys = [CategoryModel]()
    
    var ref = Database.database().reference()
    
    var a = ["asa" , "asasad", "bac" , "kol ", "lo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: privateIdentifier, bundle: nil), forCellReuseIdentifier: privateIdentifier)
        
    }
    
    func retrieveDataQuestion(){
        self.ref.child("Mastersheet").observeSingleEvent(of: .value) { (snapshot) in
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    print(snap.key)
                    let myKey = snap.key
                    self.ref.child("Mastersheet").child(myKey).observeSingleEvent(of: .value) { (mySnap) in
                        let value = snap.value as? NSDictionary
                        let categoryId = value?["categoryId"] as? String
                        let nameCategory = value?["nameCategory"] as? String
                        
                        
                        
                    }
                }
            }
        }
        
    }
    
}



extension CategoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: privateIdentifier, for: indexPath) as! CategoryTableViewCell
        var data = a[indexPath.row]
        cell.lblNameCategory.text = a[indexPath.row]
        return cell
    }
    
    
}
