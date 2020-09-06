//
//  CategoryModel.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/3/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation

struct Category {
      var id:Int
      var name:String
      var image:String
     
    
    init(id:Int, name:String, image:String){
        self.id = id
        self.name = name
        self.image = image
    }
      
}
