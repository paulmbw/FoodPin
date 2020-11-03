//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Paul Waweru on 12/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

// MARK: This is the Detail view of the controller

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    @IBOutlet var tableView: UITableView!
    
    // this did not change the navigation status bar style, becuase this view controller
    // is embedded inside of a navigation controller and it uses the style specified in this
    // navigation controller, not this one! We need to extend the UINavigationController
    // return the topViewController (the controller that is currently visible on the screen)
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    var restaurant = Restaurant()
    
    // we need to call prepare so we can pass data from this entrypoint to the concerning view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restuarant = restaurant
        }
    }

    /**
     Whatever processing you have that needs to be done once. e.g. setting UILabel texts
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        // configure the view
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
        
        // customizing the navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        tableView.contentInsetAdjustmentBehavior = .never
        
        // this prevents hiding the bars when you swipe up
        navigationController?.hidesBarsOnSwipe = false
    }
    
    /**
     Whatever processing that needs to change every time the page is loaded. e.g. fetching list of suggested friends to add
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // fixes a bug where the back button disappeared when navigating to this screen,
        // because hidesBarsOnSwipe is set to false in viewDidLoad.
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        navigationController?.navigationBar.barStyle = .black
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // we're returning three because the view has a image header, and the two prototype cells
        // this has changed from three to five becase we have the image header, the two prototype cells, and the two new cells for the
        // "map text" and the map
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.phone
            cell.selectionStyle = .none
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.location
            cell.selectionStyle = .none
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.description
            cell.selectionStyle = .none
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
            cell.titleLabel.text = "Where to find us"
            cell.selectionStyle = .none
            
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            cell.selectionStyle = .none
            
            // configue the map
            cell.configure(location: restaurant.location)
            return cell
        default:
            fatalError("Failed to create the table view cell for the \(String(describing: RestaurantDetailViewController.self))")
        }
    }
}
