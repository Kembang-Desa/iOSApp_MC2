//
//  UndoneTableViewCell.swift
//  iOSApp
//
//  Created by Hastomi Riduan Munthe on 21/07/22.
//

import UIKit

class UndoneTableViewCell: UITableViewCell {
    @IBOutlet var undoneList: UILabel!
    @IBOutlet var playButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func playButtons(_ sender: Any) {
        
    }
}
