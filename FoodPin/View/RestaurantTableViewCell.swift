//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Paul Waweru on 22/09/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

/**
 This class serves as the model for the cell. This class will connect to the interface builder.
 @IBOutlet are properties of classes, while IBAction are methods of classes.
 This class represents the cell if the list of restaurants.
 */

class RestaurantTableViewCell: UITableViewCell {
    
    // IBOutlet is what connects code in .swift to components in .storyboard
    // the exclamation mark says we know nameLabel will ALWAYS have a value so we can safely force unwrap. This will fail if nameLabel was UILabel? (which means, I may or may not have a value so don't force unwarp me.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
