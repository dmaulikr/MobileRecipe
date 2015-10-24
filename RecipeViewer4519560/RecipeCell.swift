//
//  RecipeCell.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/19/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var clickButton: CustomButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
