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
    var childArray:[Child] = [Child]()
    
    var scoreRating:Float
//    var starsChoice:[]
    
    init(roomCount:Int,adultCount:Int,childCount:Int,scoreRating:Float) {
        self.roomCount = roomCount
        self.adultCount = adultCount
        self.childCount = childCount
        self.scoreRating = scoreRating
    }
    
//    func addChild(childNO:Int){
//        childArray.append(Child(childName: "兒童\(childNO)", childAge: 12))
//    }
    func addChild(){
        if childArray.count < 9{
           childArray.append(Child(childName: "兒童\(childArray.count + 1)", childAge: "12歲"))
        }
    }
    
//    func removeChild(childNO:Int){
//        if childNO >= 1{
//            childArray.removeAll()
//            self.addChild(childNO: childNO)
//        }else{
//            childArray = [Child]()
//            self.addChild(childNO: childNO)
//        }
//
//    }
    func removeChild(){
        if childArray.count >= 1{
            childArray.remove(at: childArray.count - 1)
        }else{
            childArray = [Child]()
        }
        
    }
    
//    func makeChild(childCount:Int){
//        if childCount == 0{
//            childArray = [Child]()
//        }
//        for i in 1...childCount{
////            childArray.append(Child(childName: "兒童\(i)", childAge: 12))
//            childArray[i-1] = Child(childName: "兒童\(i)", childAge: 12)
//        }
//    }
    
}

class Child {
    var childName:String
    var childAge:String
    //age型別帶入的是字串，因為考慮到配合後面有<1歲這種無法以Int表示的情況
    init(childName:String,childAge:String) {
        self.childName = childName
        self.childAge = childAge
    }
}
