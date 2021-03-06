//
//  ChildDetailCell.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class ChildDetailCell: UITableViewCell {
    
    
    @IBOutlet weak var whichChildLabel: UILabel!
    @IBOutlet weak var howOldOfChildLabel: UILabel!
    
    
    func updateUI(index:IndexPath, childArray:[Child]){
        whichChildLabel.text = childArray[index.row - 4].childName
        howOldOfChildLabel.text = childArray[index.row - 4].childAge
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
