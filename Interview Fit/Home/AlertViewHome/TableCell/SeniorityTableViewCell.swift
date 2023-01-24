//
//  SeniorityTableViewCell.swift
//  Interview Fit
//
//  Created by Moises Lugo Aguilar on 24/01/23.
//

import UIKit

class SeniorityTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var containerCell: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
