//
//  TableViewCell.swift
//  DynamicPrototypes
//
//  Created by Danillo on 29/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCell.image? = (imageCell.image?.withRenderingMode(.alwaysTemplate))!
        imageCell.tintColor = UIColor.green
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
