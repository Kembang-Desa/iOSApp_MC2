//
//  InputTableViewCell.swift
//  iOSApp
//
//  Created by Ditha Nurcahya Avianty on 29/06/22.
//

import UIKit

class InputTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgInputTransaction: UIImageView!
    @IBOutlet weak var labelInputTransaction: UILabel!
    @IBOutlet weak var buttonInputTransaction: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
