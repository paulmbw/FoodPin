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
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        // configure the view
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
    }
}
