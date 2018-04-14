//
//  peopleCell.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class PeopleCell: UITableViewCell {
    
    
    @IBOutlet weak var peopleLabel: UILabel!
      
    func updateUI(model:InfoModel){
        let peopleString = NSMutableAttributedString(string:"\(model.roomCount)間客房 \(model.adultCount)位大人 \(model.childCount)位兒童")
        //同一個Label中字體的顏色不同
        peopleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSRange(location: 0, length: 1))
        //因為adultCount可以有兩位會影響後面字串的範圍
        if model.adultCount < 10{
            peopleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSRange(location: 5, length: 1))
            
            peopleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSRange(location: 10, length: 1))
        }else{
            peopleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSRange(location: 5, length: 2))
            
            peopleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSRange(location: 11, length: 1))
        }
        

        //改變同一個Label中字體的大小不同
        peopleString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 22), range: NSRange(location: 0, length: 1))
        if model.adultCount < 10{
            peopleString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 22), range: NSRange(location: 5, length: 1))
            peopleString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 22), range: NSRange(location: 10, length: 1))
        }else{
            peopleString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 22), range: NSRange(location: 5, length: 2))
            peopleString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 22), range: NSRange(location: 11, length: 1))
        }
        
        peopleLabel.attributedText = peopleString
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


