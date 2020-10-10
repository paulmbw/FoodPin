//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Paul Waweru on 21/09/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//  Life is good:))

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames: [String] = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages: [String] = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited: [Bool] = Array(repeating: false, count: 21)
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /**
        Returns the number of rows based on the data available. In this case, return the number of elements in hte
        restaurentImages array
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    /**
     This is called for each element. This tells swift, for each element in the list of rows, get the cell (or the row) and set the text and image 
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.locationLabel?.text = restaurantLocations[indexPath.row]
        cell.typeLabel?.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none

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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I have been selected")
        // create an option menu
        let optionMenu = UIAlertController(title: nil, message: "What would you like to do?", preferredStyle: .actionSheet)
        
        self.setAlertControllerForIPadWithAlertController(indexPath: indexPath, alertController: optionMenu)
        
        // add options to the menue
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // This is a closure you can pass to other methods
        let callActionHandler = {
            (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service unavailable", message: "Sorry, the call feature is not available yet. Please try again alter", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call 07340339473", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        let buttonTitle = self.restaurantIsVisited[indexPath.row] ? "Check out" : "Check in"
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        
        imageView.image = UIImage(named: "heart-tick")
        
        // sets the accessory type of the cell to checked
        let checkinAction = UIAlertAction(title: buttonTitle, style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
            
            if self.restaurantIsVisited[indexPath.row] {
                cell?.accessoryType = .none
                self.restaurantIsVisited[indexPath.row] = false
            } else {
                cell?.accessoryType = .checkmark
                self.restaurantIsVisited[indexPath.row] = true
            }
        })
        
        // add option to optionMenu
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(checkinAction)
        
        // show the menu
        present(optionMenu, animated: true, completion: nil)
        
        // deselect the row
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    /**
     Adds options when swiping left from the cell
     */
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // adding a delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, sourceView, completionHandler) in
            // delete the row from the data source
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // dismiss the action button when we finish deleting the row
            completionHandler(true)
        })
        
        // adding a share action
        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {(action, sourceView, completionHandler) in
            let defaultText = "Just checking in at \(self.restaurantNames[indexPath.row]) in \(self.restaurantLocations[indexPath.row])"
            
            let activityController: UIActivityViewController
            
            // imageToShare is optional, depends on if there is a image in the array
            // we use if let to verify if an optional contains a value or not
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
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
        cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
        
        if self.restaurantIsVisited[indexPath.row] {
            cell?.accessoryType = .none
            self.restaurantIsVisited[indexPath.row] = false
            action.image = UIImage(systemName: "arrow.uturn.left")
        } else {
            cell?.accessoryType = .checkmark
            self.restaurantIsVisited[indexPath.row] = true
            
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
