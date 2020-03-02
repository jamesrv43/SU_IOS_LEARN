//
//  EmployeeTableViewCell.swift
//  SU_IOS_LEARN
//
//  Created by AI Apple on 2/3/2563 BE.
//  Copyright © 2563 siamu. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_Id: UILabel!
    @IBOutlet weak var lbl_Name: UILabel!
    @IBOutlet weak var lbl_Email: UILabel!
    @IBOutlet weak var imv_Avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
