//
//  TimerView.swift
//  SampleTimerApp
//
//  Created by くりすせいま on 2020/12/06.
//  Copyright © 2020 星舞. All rights reserved.
//

import UIKit

protocol TimerViewDelegate {
    func setTImer() -> Int
    func endTimer()
}

class TimerView: UIView {
    
    @IBOutlet weak var countDwonLabel: UILabel! 
    
    @IBOutlet weak var timerActionLabel: UIButton!
    
    var timer = Timer()
    
    var timerCount = 0
    
    var delegate: TimerViewDelegate? {
        didSet {
            guard let count = self.delegate?.setTImer() else {
                return
            }
            
            timerCount = count
            countDwonLabel.text = String(count)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibInit()
    }
    
    fileprivate func nibInit() {
        guard let view = UINib(nibName: "TimerView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    
    @IBAction func startButtonDidTapped(_ sender: Any) {
        if !timer.isValid {
            startTimer()
            timerActionLabel.setTitle("ストップ", for: .normal)
        } else {
            pause()
            timerActionLabel.setTitle("スタート", for: .normal)
        }
    }
    
    func startTimer() {
        if timerCount != 0 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
    }
    
    func pause() {
        timer.invalidate()
    }
    
    func reloadData() {
        guard let count = self.delegate?.setTImer() else {
            return
        }
        
        timerCount = count
        countDwonLabel.text = String(count)
    }
    
    @objc func timerAction() {
        timerCount -= 1
        
        if timerCount == 0 {
            self.delegate?.endTimer()
            timer.invalidate()
            timerCount = 0
            timerActionLabel.setTitle("スタート", for: .normal)
        }
        countDwonLabel.text = String(timerCount)
    }
}

