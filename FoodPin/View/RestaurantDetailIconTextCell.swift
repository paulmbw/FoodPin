//
//  RestaurantDetailIconTextCell.swift
//  FoodPin
//
//  Created by Paul Waweru on 22/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

class RestaurantDetailIconTextCell: UITableViewCell {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var shortTextLabel: UILabel! {
        didSet {
            // This text may expand to multiple rows so we want to set the number of lines to 0
            shortTextLabel.numberOfLines = 0
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
