//
//  CustomTableViewCell.swift
//  DynamicPrototypes
//
//  Created by Danillo on 29/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
