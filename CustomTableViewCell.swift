//
//  CustomTableViewCell.swift
//  My Movie List
//
//  Created by Raiyan Rahman on 2018-10-23.
//  Copyright © 2018 Raiyan Rahman. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet var addFavButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
