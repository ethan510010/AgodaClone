//
//  DescriptionCell.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var childAgeLabel: UILabel!
    @IBOutlet weak var pleaseEnterChildAgeLabel: UILabel!
    @IBOutlet weak var withChildLabel: UILabel!
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var ensureChildLabel: UILabel!
    
    
    func noChildDescription(){
        withChildLabel.text = "有帶小孩同行嗎？"
        houseImageView.isHidden = false
        ensureChildLabel.text = "確實填寫小孩人數與年齡，我們就能幫你找出最划算的房價與房型喔！"
        pleaseEnterChildAgeLabel.text = ""
        childAgeLabel.text = ""
    }
    
    func withChildDescription(){
        withChildLabel.text = ""
        houseImageView.isHidden = true
        ensureChildLabel.text = ""
        pleaseEnterChildAgeLabel.text = "請輸入每位兒童的年齡以便尋找最適合的房型和床型組合。"
        childAgeLabel.text = "兒童年齡"
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
