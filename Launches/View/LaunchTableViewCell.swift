//
//  TableViewCell.swift
//  Launches
//
//  Created by Ömer Fildişi on 13.03.2021.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

    @IBOutlet weak var missionName: UILabel!
    @IBOutlet weak var launchYear: UILabel!
    @IBOutlet weak var launchSucces: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
