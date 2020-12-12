//
//  TimerViewController.swift
//  SampleTimerApp
//
//  Created by くりすせいま on 2020/12/06.
//  Copyright © 2020 星舞. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerView: TimerView!
    
    @IBOutlet weak var timerPickerView: UIPickerView!
    
    let pickerList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    var selectedTime: Int = 1 {
        didSet {
            timerView.reloadData()
        }
    }
         
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerView.delegate = self
        
        timerPickerView.dataSource = self
        timerPickerView.delegate = self
        
        self.view.backgroundColor = UIColor.blue
    }
}

extension TimerViewController: TimerViewDelegate {
    func setTImer() -> Int {
        return selectedTime
    }
    
    func endTimer() {
        self.view.backgroundColor = UIColor.red
    }
}

extension TimerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = pickerList[row]
        return item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if !timerView.timer.isValid {
            let result = pickerList[row]
            selectedTime = Int(result)!
        } 
    }
}

