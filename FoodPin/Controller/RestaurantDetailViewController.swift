//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Paul Waweru on 12/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

// MARK: This is the Detail view of the controller

class RestaurantDetailViewController: UIViewController {
    
    var restaurant = Restaurant()
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantLocationLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantImageView.image = UIImage(named: restaurant.image)
        restaurantNameLabel.text = restaurant.name
        restaurantLocationLabel.text = restaurant.location
        restaurantTypeLabel.text = restaurant.type
    }
}
