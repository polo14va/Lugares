//
//  Place.swift
//  Lugares
//
//  Created by Pedro Martinez on 30/9/16.
//  Copyright © 2016 Pedro Martinez. All rights reserved.
//

import Foundation
import UIKit

class Place {
    var name = ""
    var type = ""
    var location = ""
    var website = ""
    var telephone = ""
    var image = UIImage()
    var rating = "rating"
    
    
    init(name: String, type: String, location:String,telephone: String, website: String, image: UIImage){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.telephone = telephone
        self.website = website
    }
}
