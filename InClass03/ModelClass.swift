//
//  ModelClass.swift
//  InClass03
//
//  Created by Kabra, Sunidhi on 10/31/18.
//  Copyright © 2018 Kabra, Sunidhi. All rights reserved.
//

import Foundation

struct ModelClass {
    var title:String?
    var developer:String?
    var imgSmall:String?
    var imgLarge:String?
    var price:String?
    var date:String?
    
    init(title:String, developer:String, imgSmall:String, imgLarge:String, price:String, date:String){
        self.title = title
        self.developer = developer
        self.imgSmall = imgSmall
        self.imgLarge = imgLarge
        self.price = price
        self.date = date
    }
}
