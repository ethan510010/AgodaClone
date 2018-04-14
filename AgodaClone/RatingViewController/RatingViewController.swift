//
//  RatingViewController.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/16.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

//要把值傳回ViewController要做的
protocol RatingSliderDelegate{
    func ratingSliderDidScrolled(value:Float)
}

class RatingViewController: UIViewController {
    
    //用來接受ViewController傳過來的值
    var ratingSliderScore:Float = 0
    
    var ratingSliderDelegate:RatingSliderDelegate?
    
    @IBOutlet weak var guestRating: UILabel!
    @IBOutlet weak var guestRatingSlider: UISlider!
    
    //確認按鈕
    @IBAction func ensureAction(_ sender: UIButton) {
        //要把值傳到第一個畫面
        ratingSliderDelegate?.ratingSliderDidScrolled(value: guestRatingSlider.value)
        dismiss(animated: true, completion: nil)
    }
    
    
    //返回按鈕
    @IBAction func backToMainView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //控制最後一個Slider
    @IBAction func ratingAction(_ sender: UISlider) {
        
        
        //控制slider每次跑0.5
        let step:Float = 0.5
        guestRatingSlider.value = roundf(guestRatingSlider.value / step) * step
        
        
        updateRatingSliderValue()
        
    }
    
    //自訂最後一個slider顯示數值的方法
    func updateRatingSliderValue(){
        //guestRatingLabel的顯示
        if guestRatingSlider.value == 0{
            guestRating.text = "Guest rating: All"
        }else if guestRatingSlider.value == 10{
            guestRating.text = "Guest rating: 10"
        }else{
            guestRating.text = "Guest rating: \(guestRatingSlider.value) or higher"
        }
    }
    
    //清除按鈕
    @IBAction func resetAction(_ sender: UIBarButtonItem) {
       guestRatingSlider.value = 0
       updateRatingSliderValue()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定guestRatingSlider第一次出來時的起始值位置
        guestRatingSlider.value = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //設定navigationBar的樣式
        self.navigationItem.leftBarButtonItem?.title = "<"
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationItem.rightBarButtonItem?.title = "清除"
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        //把bar的顏色改成藍色
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        
        //設定guestRatingSlider之後每次出現的最大最小值
        guestRatingSlider.maximumValue = 10
        guestRatingSlider.minimumValue = 0
        
        //接受前面傳過來的值
        guestRatingSlider.value = ratingSliderScore
        updateRatingSliderValue()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
