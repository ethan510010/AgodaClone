//
//  RatingCell.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class RatingCell: UITableViewCell {
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    func updateUI(model:InfoModel){
        if model.scoreRating > 0 && model.scoreRating < 10 {
            ratingLabel.text = "評鑑\(model.scoreRating)+"
        }else if model.scoreRating == 10{
            ratingLabel.text = "評鑑\(model.scoreRating)"
        }else if model.scoreRating == 0{
            ratingLabel.text = "自訂"
        }
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
