//
//  UserDataTableViewCell.swift
//  plistDemo
//
//  Created by sachin shinde on 02/01/20.
//  Copyright © 2020 sachin shinde. All rights reserved.
//

import UIKit

class UserDataTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblPassword: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
