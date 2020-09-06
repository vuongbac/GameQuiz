//
//  CategoryViewController.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/3/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseAnalytics

class CategoryViewController: UIViewController {
    
    let privateIdentifier = "CategoryTableViewCell"
    var refArtists:DatabaseReference!
    var categorys = [Category]()
    var ref = Database.database().reference()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: privateIdentifier, bundle: nil), forCellReuseIdentifier: privateIdentifier)
        GetListCategory()
    }
    
    func GetListCategory(){
        ref = Database.database().reference().child("Category")
        ref.observe(DataEventType.value) { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.categorys.removeAll()
                
                for artist in snapshot.children.allObjects as! [DataSnapshot] {
                    let art = artist.value as? [String:AnyObject]
                    let artName = art?["Name"]
                    let artId = art?["Id"]
                    let artImage = art?["Image"]
                    let arts = Category(id: artId as! Int , name: artName as! String, image: artImage as! String)
                    self.categorys.append(arts)
                }
                self.tableView.reloadData()
            }
        }
    }
}


extension CategoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: privateIdentifier, for: indexPath) as! CategoryTableViewCell
        cell.setUp(data: categorys[indexPath.row])
        return cell
    }
}
