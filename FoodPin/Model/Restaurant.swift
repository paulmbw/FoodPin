//
//  Restaurant.swift
//  FoodPin
//
//  Created by Paul Waweru on 18/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import Foundation

// MARK: Restaurant model class
class Restaurant {
    var name: String
    var type: String
    var location: String
    var phone: String
    var description: String
    var image: String
    var isVisited: Bool
    
    // a bit like constuctor in JS - known as the designated initializer
    init(name: String, type: String, location: String, phone: String, description: String, image: String, isVisited: Bool) {
        // self is used to differentiate between the property of this class and the arguments of the initializers.
        // just remember the this keyword from the JS realm
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.description = description
        self.image = image
        self.isVisited = isVisited
    }
    
    // optional initializer, sets default values when initialized using Restaurant()
    convenience init() {
        self.init(name: "", type: "", location: "", phone: "", description: "", image: "", isVisited: false)
    }
    
}
