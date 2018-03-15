//
//  MemberCell.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

protocol MemberCountDelegate {
    func whichMemberCountDidChangedForDecreasing(index:IndexPath,model:InfoModel)
    func whichMemberCountDidChangedForIncreasing(index:IndexPath,model:InfoModel)
}

class MemberCell: UITableViewCell {
    
    
    //要讓ViewController知道是哪個cell的button被點擊到
    var index:IndexPath?
    var infoModel:InfoModel?
    
    var delegate:MemberCountDelegate?
    
    
    let titleDescription = ["間房間","位大人","位小孩"]
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        if let index = index, let infoModel = infoModel{
            delegate?.whichMemberCountDidChangedForDecreasing(index:index,model:infoModel)
        }
    }
    
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        if let index = index, let infoModel = infoModel{
            delegate?.whichMemberCountDidChangedForIncreasing(index: index, model: infoModel)
        }
    }
    
    func updateUI(index:IndexPath, model:InfoModel){
        switch index.row {
        case 0:
            countLabel.text = "\(model.roomCount)"
        case 1:
            countLabel.text = "\(model.adultCount)"
        default:
            countLabel.text = "\(model.childCount)"
        }
        descriptionLabel.text = titleDescription[index.row]
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
