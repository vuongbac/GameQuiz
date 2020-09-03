//
//  CategoryModel.swift
//  GameQuiz
//
//  Created by Vương Toàn Bắc on 9/3/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation

struct CategoryModel:Codable {
    var id:String?
      var nameCategory:String?
      var imageCategory:String?
      
    
    init(id:String, nameCategory:String, imageCategory:String ) {
        self.id = id
        self.nameCategory = nameCategory
        self.imageCategory =  imageCategory
    }
}
