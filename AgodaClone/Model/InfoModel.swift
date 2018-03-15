//
//  InfoModel.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation


class InfoModel{
//    var location:String
//    var arrivalDate:String
//    var leaveDate:String
    var roomCount:Int
    var adultCount:Int
    var childCount:Int
//    var starsChoice:[]
    
    init(roomCount:Int,adultCount:Int,childCount:Int) {
        self.roomCount = roomCount
        self.adultCount = adultCount
        self.childCount = childCount
    }
}
