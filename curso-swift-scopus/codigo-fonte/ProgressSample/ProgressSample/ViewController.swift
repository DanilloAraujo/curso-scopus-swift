//
//  ViewController.swift
//  ProgressSample
//
//  Created by Danillo on 06/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {
    
    var count = 60
    var minute = 25
    
    var timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        
        timer.invalidate()
        count = 60
        minute = 25
        timerLabel.text = "00"
        minuteLabel.text = "25"
    }
    
    @IBAction func startPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
    }
    
    @objc func counter() {
        if count != 0 {
            count -= 1
            if count > 9 {
                timerLabel.text = "\(count)"
            }
            else {
                timerLabel.text = "0\(count)"
            }
            if minute == 25 {
                minute = 24
                minuteLabel.text = "24"
            }
            
        }
        else if count == 0{
            count = 59
            timerLabel.text = "\(count)"
            if minute != 0 {
                minute -= 1
                minuteLabel.text = "\(minute)"
            }
            else {
                timer.invalidate()
                minute = 25
            }
            
        }
        
    }
    
    @IBOutlet weak var btnImage: UIButton!
    
    @IBAction func testLoading(_ sender: Any) {
        self.showLoading()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(dismissLoading), userInfo: nil, repeats: false)
    }
    
    @objc func dismissLoading() {
        if self.btnImage.titleLabel?.text == "🤮" {
            self.btnImage.titleLabel?.text = "💀"
        }
        self.hideLoading()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension UIViewController {
    
    func showLoading() {
        let progressView = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressView.label.text = "Loading..."
        progressView.mode = .indeterminate
    }
    
    func hideLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
