//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by Paul Waweru on 21/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {
    
    @IBOutlet var headerImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel! {
        // this is known as a property observer. Once the value of nameLabel changes, we set the property of
        // nameLabel.numberOfLines to 0. This is the preferred way of doing this, because nameLabel can be
        // set in another location of the app, so using didSet will ensure the value is consistent wherever it is set
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var typeLabel: UILabel! {
        didSet {
            // both of these properties are important as they set the corner radius of the type label
            typeLabel.layer.cornerRadius = 5.0
            typeLabel.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var heartImageView: UIImageView! {
        didSet {
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            heartImageView.tintColor = .white
        }
    }

}
