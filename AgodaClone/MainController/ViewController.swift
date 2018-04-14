//
//  ViewController.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/15.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PassPeopleDelegate, RatingSliderDelegate {
    //實作傳遞評價的protocol內方法
    func ratingSliderDidScrolled(value: Float) {
        self.infoModel.scoreRating = value
        mainTableView.reloadData()
    }
    
    //實作傳遞成員資料的protocol內方法
    func passPeopleData(model: InfoModel) {
        //方法中要實做的其實只有把membersViewController的model傳遞過來這邊的model(本練習故意不用singleton因為考慮到之後可能會進行網路請求，頁面間的傳值還是以delegate為主)
        self.infoModel = model
        print("pass data success")
        mainTableView.reloadData()
    }
    
    @IBOutlet weak var logoView: UIView!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var infoModel = InfoModel(roomCount: 1, adultCount: 1, childCount: 0, scoreRating: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoView.backgroundColor = .clear
        
        //將navigationBar顏色弄成透明的
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        //設定tableView的委派
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        
        //設定mainTableView的樣式
        mainTableView.backgroundColor = .clear
        mainTableView.separatorStyle = .none
        mainTableView.isScrollEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath {
        case [0,0]:
            let locationCell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
            locationCell.selectionStyle = .none
            return locationCell
        case [1,0]:
            let durationCell = tableView.dequeueReusableCell(withIdentifier: "durationCell", for: indexPath)
            durationCell.selectionStyle = .none
            return durationCell
        case [2,0]:
            let peopleCell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleCell
            print("\(infoModel.roomCount)間房 \(infoModel.adultCount)位大人 \(infoModel.childCount)位小孩")
            peopleCell.updateUI(model: infoModel)
            peopleCell.selectionStyle = .none
            return peopleCell
        case [3,0]:
            let ratingCell = tableView.dequeueReusableCell(withIdentifier: "ratingCell", for: indexPath) as! RatingCell
            ratingCell.updateUI(model: infoModel)
            ratingCell.selectionStyle = .none
            return ratingCell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return self.view.frame.height * (10/667)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    //cell的間隙在這邊我們利用viewForHearder來達成，並將此view的顏色用成clear就可以達到此效果
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView()
            view.backgroundColor = .clear
            return view
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case [1,0]:
            return self.view.frame.height * (88/667)
        default:
            return self.view.frame.height * (44/667)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("selected: \(indexPath)")
        if indexPath == [2,0]{
//            navigationController?.pushViewController(MembersViewController(), animated: true)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "pushMembersView", sender: nil)
            }
        }else if indexPath == [3,0]{
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "pushRatingView", sender: nil)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushMembersView"{
            if let NC = segue.destination as? UINavigationController{
                if let memebersVC = NC.viewControllers.first as? MembersViewController{
                    //下面一行是為了讓值可以從後面傳回來而設的delegate
                    memebersVC.passPeopleDelegate = self
                    //下面這行是要把這邊的值傳過去給MembersVC
                    memebersVC.info = self.infoModel
                }
            }
        }else if segue.identifier == "pushRatingView"{
            if let NC = segue.destination as? UINavigationController{
                if let ratingVC = NC.viewControllers.first as? RatingViewController{
                    //下面一行是為了讓值可以從後面傳回來而設的delegate
                    ratingVC.ratingSliderDelegate = self
                    //
                    ratingVC.ratingSliderScore = self.infoModel.scoreRating
                }
            }
        }
    }
}



