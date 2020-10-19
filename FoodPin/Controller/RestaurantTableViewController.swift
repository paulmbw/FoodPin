//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Paul Waweru on 21/09/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//  Life is good:))

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants : [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false), Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // sets the size of the title in the navigation bar. When scrolled to the top,
        // the size is large, when scrolling down, the size decreases.
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /**
     This method gets executed when a transition is about to happen, As we have defined the seque to be showRestaurantDetail (with the Show style animiation),
     we want to check the type of the segue to match showRestaurantDetail, and we want to pass the data from this view controller to the RestaurantDetailViewController.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                
                // restaurantImageName and the other properties live in RestaurantDetailViewController, so we
                // need to set them before we nagivate otherwise they will be nil.w
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
    /**
     Returns the number of rows based on the data available. In this case, return the number of elements in hte
     restaurentImages array
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    
    /**
     This is called for each element. This tells swift, for each element in the list of rows, get the cell (or the row) and set the text and image 
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel?.text = restaurants[indexPath.row].name
        cell.locationLabel?.text = restaurants[indexPath.row].location
        cell.typeLabel?.text = restaurants[indexPath.row].type
        cell.thumbnailImageView?.image = UIImage(named: restaurants[indexPath.row].image)
        
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
    // below is to fix the bug in iPad wherein the alert controller is not used, instead the pop over controller is used
    // e.g. use popovers for iPad and use alert controllers for iPhone
    func setAlertControllerForIPadWithAlertController(indexPath: IndexPath, alertController: UIAlertController) -> Void {
        if let popoverController = alertController.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
    }
    
    // below is to fix the bug in iPad wherein the alert controller is not used, instead the pop over controller is used
    // e.g. use popovers for iPad and use alert controllers for iPhone
    func setAlertControllerForIPadWithActivityViewController(indexPath: IndexPath, activityViewController: UIActivityViewController) -> Void {
        if let popoverController = activityViewController.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
    }
    
    /**
     Code is execuded when a row is pressed
     */
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        print("I have been selected")
    //        // create an option menu
    //        let optionMenu = UIAlertController(title: nil, message: "What would you like to do?", preferredStyle: .actionSheet)
    //
    //        self.setAlertControllerForIPadWithAlertController(indexPath: indexPath, alertController: optionMenu)
    //
    //        // add options to the menue
    //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    //
    //        // This is a closure you can pass to other methods
    //        let callActionHandler = {
    //            (action: UIAlertAction!) -> Void in
    //            let alertMessage = UIAlertController(title: "Service unavailable", message: "Sorry, the call feature is not available yet. Please try again alter", preferredStyle: .alert)
    //
    //            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    //            self.present(alertMessage, animated: true, completion: nil)
    //        }
    //
    //        let callAction = UIAlertAction(title: "Call 07340339473", style: .default, handler: callActionHandler)
    //        optionMenu.addAction(callAction)
    //
    //        let buttonTitle = self.restaurantIsVisited[indexPath.row] ? "Check out" : "Check in"
    //
    //        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
    //
    //        imageView.image = UIImage(named: "heart-tick")
    //
    //        // sets the accessory type of the cell to checked
    //        let checkinAction = UIAlertAction(title: buttonTitle, style: .default, handler: {
    //            (action: UIAlertAction!) -> Void in
    //            let cell = tableView.cellForRow(at: indexPath)
    //            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
    //
    //            if self.restaurantIsVisited[indexPath.row] {
    //                cell?.accessoryType = .none
    //                self.restaurantIsVisited[indexPath.row] = false
    //            } else {
    //                cell?.accessoryType = .checkmark
    //                self.restaurantIsVisited[indexPath.row] = true
    //            }
    //        })
    //
    //        // add option to optionMenu
    //        optionMenu.addAction(cancelAction)
    //        optionMenu.addAction(checkinAction)
    //
    //        // show the menu
    //        present(optionMenu, animated: true, completion: nil)
    //
    //        // deselect the row
    //        tableView.deselectRow(at: indexPath, animated: false)
    //    }
    
    /**
     Adds options when swiping left from the cell
     */
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // adding a delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, sourceView, completionHandler) in
            // delete the row from the data source
            self.restaurants.remove(at: indexPath.row)
            self.restaurants.remove(at: indexPath.row)
            self.restaurants.remove(at: indexPath.row)
            self.restaurants.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // dismiss the action button when we finish deleting the row
            completionHandler(true)
        })
        
        // adding a share action
        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {(action, sourceView, completionHandler) in
            let defaultText = "Just checking in at \(self.restaurants[indexPath.row].name) in \(self.restaurants[indexPath.row].location)"
            
            let activityController: UIActivityViewController
            
            // imageToShare is optional, depends on if there is a image in the array
            // we use if let to verify if an optional contains a value or not
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            self.setAlertControllerForIPadWithActivityViewController(indexPath: indexPath, activityViewController: activityController)
            
            self.present(activityController, animated: true, completion: nil)
            
            completionHandler(true)
        })
        
        // setting the background color and image of the shareAction item
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        // setting the background color and image of the deleteAction item
        deleteAction.backgroundColor = UIColor(red: 231/255.0, green: 76/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.title = "Delete"
        
        // the first item in the list of actions is the one that takes priority when swiping all the way
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfig
    }
    
    func handleCheckIn(tableView: UITableView, indexPath: IndexPath, action: UIContextualAction) -> Void {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .none : .checkmark
        
        if self.restaurants[indexPath.row].isVisited {
            cell?.accessoryType = .none
            self.restaurants[indexPath.row].isVisited = false
            action.image = UIImage(systemName: "arrow.uturn.left")
        } else {
            cell?.accessoryType = .checkmark
            self.restaurants[indexPath.row].isVisited = true
            
            action.image = UIImage(systemName: "checkmark")
        }
    }
    
    /**
     Adds options when swiping right from the cell
     */
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkinAction = UIContextualAction(style: .normal, title: "Checkin", handler: {(action, sourceView, completionHandler) in
            
            completionHandler(true)
        })
        
        self.handleCheckIn(tableView: tableView, indexPath: indexPath, action: checkinAction)
        
        
        checkinAction.backgroundColor = UIColor(red: 0.40, green: 0.79, blue: 0.08, alpha: 1.00)
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [checkinAction])
        
        return swipeConfig
    }
}


/**
 This method is used to delete a row. Although useful, we're only adding one action to the row cell. We should use UIContextualAction if we want to add a list
 of different actions
 */
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        print("deleting this row")
//
//
//        if editingStyle == .delete {
//            // tells the table view we are about to update our model (our list of restaurants)
//            tableView.beginUpdates()
//
//            // removes data from our model
//            restaurantNames.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantImages.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//
//            // delets a row in the UI with an animation
//            tableView.deleteRows(at: [indexPath], with: .fade)
//
//            // tells the table view we are finished with updating our model (our list of restaurants)
//            tableView.endUpdates()
//        }
//    }
