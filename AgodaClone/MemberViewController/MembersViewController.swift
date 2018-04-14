//
//  MembersViewController.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

protocol PassPeopleDelegate {
    func passPeopleData(model:InfoModel)
}

class MembersViewController: UIViewController, MemberCountDelegate {
    
    //為了把房間 大人數 小孩數傳給主畫面而設定的
    var passPeopleDelegate:PassPeopleDelegate?
    
    //實作protocol的方法
    func whichMemberCountDidChangedForDecreasing(index: IndexPath, model: InfoModel) {
        switch index.row {
        case 0:
            if model.roomCount > 1{
                model.roomCount -= 1
            }else{
                model.roomCount = 1
                
            }
        case 1:
            if model.adultCount > 1{
                model.adultCount -= 1
            }else{
                model.adultCount = 1
            }
        default:
            if model.childCount > 0{
                model.childCount -= 1
                //                model.makeChild(childCount: model.childCount)
                //                model.removeChild(childNO: model.childCount)
                model.removeChild()
                print(model.childCount)
                print(model.childArray)
                
                //                self.childArray = self.makeChildArray(childCount: model.childCount)
                //                print(childArray)
                //讓tableView自動捲到最後一行
                
            }else{
                model.childCount = 0
                //                model.makeChild(childCount: model.childCount)
                //                model.removeChild(childNO: model.childCount)
                model.removeChild()
                print(model.childCount)
                print(model.childArray)
                
                //                self.childArray = self.makeChildArray(childCount: model.childCount)
                //                print(childArray)
            }
        }
        
        self.memberTableView.reloadData()
        //        if model.childCount != 0{
        //            var indexPath = NSIndexPath(row: 4, section: 0)
        //            self.memberTableView.scrollToRow(at: indexPath as IndexPath, at:  UITableViewScrollPosition.top, animated: true)
        //        }
        
    }
    
    //實作protocol的方法
    func whichMemberCountDidChangedForIncreasing(index: IndexPath, model: InfoModel) {
        switch index.row {
        case 0:
            if model.roomCount < 9{
                model.roomCount += 1
            }else{
                model.roomCount = 9
            }
        case 1:
            if model.adultCount < 36{
                model.adultCount += 1
            }else{
                model.adultCount = 36
            }
        default:
            if model.childCount < 9{
                model.childCount += 1
                model.addChild()
                //                model.addChild(childNO: model.childCount)
                //                model.makeChild(childCount: model.childCount)
                print(model.childCount)
                print(model.childArray)
                //                self.childArray = self.makeChildArray(childCount: model.childCount)
                //                print(childArray)
            }else{
                model.childCount = 9
                model.addChild()
                //                model.addChild(childNO: model.childCount)
                //                model.makeChild(childCount: model.childCount)
                print(model.childCount)
                print(model.childArray)
                //                self.childArray = self.makeChildArray(childCount: model.childCount)
                //                print(childArray)
            }
        }
        self.memberTableView.reloadData()
//        if model.childCount != 0{
//            var indexPath = NSIndexPath(row: 4 + model.childCount - 1 , section: 0)
//            
//            self.memberTableView.scrollToRow(at: indexPath as IndexPath, at:  UITableViewScrollPosition.top, animated: true)
//        }
    }
    
    
    //用來製造半黑透明效果的View
    @IBOutlet weak var maskView: UIView!
    
    
    //實體化InfoModel
    var info = InfoModel(roomCount: 1, adultCount: 1, childCount: 0, scoreRating: 0)
    
    @IBOutlet weak var memberTableView: UITableView!
    
    
    @IBAction func ensureButton(_ sender: UIButton) {
//        print("\(info.roomCount)間房 \(info.adultCount)位大人 \(info.childCount)位小孩")
        passPeopleDelegate?.passPeopleData(model: info)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func backToMainView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設定tableView的委派
        memberTableView.delegate = self
        memberTableView.dataSource = self
        
        //把navigationbar中的leftBarButtonItem的title改顏色及內容
        self.navigationItem.leftBarButtonItem?.title = "<"
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        //把bar的顏色改成藍色
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        maskView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MembersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if info.childCount == 0{
            return 4
        }else{
            return 4 + info.childCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0,1,2:
            let memberCell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! MemberCell
            //傳值
            memberCell.index = indexPath
            memberCell.infoModel = info
            memberCell.delegate = self
            //更新介面呼叫
            memberCell.updateUI(index: indexPath, model: info)
            return memberCell
        case 3:
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionCell
            descriptionCell.childDescription(childCount: info.childCount)
            return descriptionCell
        default:
            let childDetailCell = tableView.dequeueReusableCell(withIdentifier: "childDetailCell", for: indexPath) as! ChildDetailCell
            childDetailCell.updateUI(index: indexPath, childArray: info.childArray)
            //            childDetailCell.updateUI(index: indexPath, childArray: childArray)
            //            childDetailCell.whichChildLabel.text = childArray[indexPath.row - 4].childName
            return childDetailCell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * (70/667)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //當點擊到row >= 4的列時，就跳到選擇小孩年齡的ChooseChildAgeViewController
        if indexPath.row >= 4{
            //
            maskView.isHidden = false
            maskView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            
            //設定present上來的chooseChildVC顏色是透的，背景黑色我們透過maskView來實現。
            let chooseChildAgeVC = storyboard?.instantiateViewController(withIdentifier: "ChooseChildAgeViewController") as! ChooseChildAgeViewController
            
            chooseChildAgeVC.view.backgroundColor = .clear
            //把這邊的小孩名稱傳到chooseChildVC
            chooseChildAgeVC.whichChildDidSelected = info.childArray[indexPath.row - 4].childName
            //            chooseChildAgeVC.whichChildDidSelected = childArray[indexPath.row - 4].childName
            //要讓後面的ChooseChildAgeViewController
            chooseChildAgeVC.delegate = self
            chooseChildAgeVC.index = indexPath
            
            self.present(chooseChildAgeVC, animated: true, completion: nil)
        }
    }
}

extension MembersViewController: ChildAgeSelectionDelegate{
    
    func whichChildAgeDidChange(index: IndexPath, age: String) {
        //按下確認後maskView隱藏
        maskView.isHidden = true
        info.childArray[index.row - 4].childAge = age
        self.memberTableView.reloadData()
    }
    
    
}
