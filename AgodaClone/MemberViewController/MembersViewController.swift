//
//  MembersViewController.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController, MemberCountDelegate {
    
    func whichMemberCountDidChangedForDecreasing(index: IndexPath, model: InfoModel) {
        switch index.row {
        case 0:
            model.roomCount -= 1
        case 1:
            model.adultCount -= 1
        default:
            model.childCount -= 1
        }
        self.memberTableView.reloadData()
    }
    
    func whichMemberCountDidChangedForIncreasing(index: IndexPath, model: InfoModel) {
        switch index.row {
        case 0:
            model.roomCount += 1
        case 1:
            model.adultCount += 1
        default:
            model.childCount += 1
        }
        self.memberTableView.reloadData()
    }
    
    
    

    //實體化InfoModel
    let info = InfoModel(roomCount: 1, adultCount: 1, childCount: 0)
    
    
    @IBOutlet weak var memberTableView: UITableView!
    
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
            //
            memberCell.index = indexPath
            memberCell.infoModel = info
            memberCell.delegate = self
            
            memberCell.updateUI(index: indexPath, model: info)
            return memberCell
        case 3:
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionCell
            if info.childCount == 0{
                descriptionCell.noChildDescription()
                return descriptionCell
            }else{
                descriptionCell.withChildDescription()
                return descriptionCell
            }
        default:
            let cell = UITableViewCell()
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * (70/667)
    }
    
}
