//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by Paul Waweru on 21/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

/**
 This class is linked to the prototype cell that is named RestaurantDetailTextCell.
 */
class RestaurantDetailTextCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
