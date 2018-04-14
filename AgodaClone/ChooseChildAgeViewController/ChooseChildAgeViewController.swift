//
//  ChooseChildAgeViewController.swift
//  AgodaClone
//
//  Created by EthanLin on 2018/3/16.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

//要把值傳到前一個畫面MembersViewController，定一個protocol
protocol ChildAgeSelectionDelegate {
    //這裏age是帶入string，因為有<1歲這種可能
    func whichChildAgeDidChange(index:IndexPath, age:String)
}

class ChooseChildAgeViewController: UIViewController {
    
    let ageForChild = ["<1歲","1歲","2歲","3歲","4歲","5歲","6歲","7歲","8歲","9歲","10歲","11歲","12歲","13歲","14歲","15歲","16歲","17歲"]
    
    //為了能夠把選到的值傳給前面的ViewController要設定此兩個屬性
    var index:IndexPath?
    var delegate:ChildAgeSelectionDelegate?
    
    
    //接收前面傳過來的值，知道是哪個小孩被點選
    var whichChildDidSelected:String?
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var whichChildLabel: UILabel!
    @IBOutlet weak var chooseAgePickerView: UIPickerView!
    
    @IBAction func ensureAction(_ sender: UIButton) {
        if let index = index{
           delegate?.whichChildAgeDidChange(index: index, age: ageForChild[chooseAgePickerView.selectedRow(inComponent: 0)])
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //因為原本的View已經被設定成半黑透明，所以我們在下方有在拉一個子view(whiteView)
        whiteView.backgroundColor = .white
        
        //為了顯示半黑透明
        self.modalPresentationStyle = .custom
        
        //設置pickerView的delegate及dataSource
        chooseAgePickerView.delegate = self
        chooseAgePickerView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        whichChildLabel.text = whichChildDidSelected
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ChooseChildAgeViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageForChild.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageForChild[row]
    }
    
}
