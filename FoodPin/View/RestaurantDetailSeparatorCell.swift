//
//  RestaurantDetailSeparatorCell.swift
//  FoodPin
//
//  Created by Paul Waweru on 31/10/2020.
//  Copyright © 2020 Paul Waweru. All rights reserved.
//

import UIKit

class RestaurantDetailSeparatorCell: UITableViewCell {
    
    /**
     After creating prototype cells, you MUST create a corresponding class for cell
     */
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
