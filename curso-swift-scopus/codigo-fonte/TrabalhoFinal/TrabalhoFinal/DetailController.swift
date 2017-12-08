//
//  DetailController.swift
//  TrabalhoFinal
//
//  Created by Danillo on 01/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit

class DetailController: UIViewController, UIGestureRecognizerDelegate {

    var selectedItem: (title: String, description: String, date: Date)?
    
    var fontSize: Float = 10.0
    
    let defaults:UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var textReminder: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func slider(_ sender: UISlider) {
        
        textReminder.font = UIFont(name: (textReminder.font?.fontName)!, size: CGFloat(sender.value))
        
        lblDescricao.font = UIFont(name: (lblDescricao.font?.fontName)!, size: CGFloat(sender.value))
        
        fontSize = sender.value
        
        defaults.set(fontSize, forKey: Config.kFontSize)
        defaults.synchronize()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = defaults.float(forKey: Config.kFontSize)
        if size != 0 {
            fontSize = size
        }
        
        textReminder.font = UIFont(name: (textReminder.font?.fontName)!, size: CGFloat(fontSize))
        
        lblDescricao.font = UIFont(name: (lblDescricao.font?.fontName)!, size: CGFloat(fontSize))

        self.view.isUserInteractionEnabled = true
        self.view.isMultipleTouchEnabled = true

        let gestureRigthSwipte = UISwipeGestureRecognizer(target: self, action: #selector(DetailController.rightSwipe( _ : )))

        gestureRigthSwipte.delegate = self
        gestureRigthSwipte.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(gestureRigthSwipte)
        
    }

    @objc func rightSwipe(_ sender : UISwipeGestureRecognizer) {
        self.tabBarController?.selectedIndex = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textReminder.text = selectedItem?.description
        datePicker.date = (selectedItem?.date)!
        datePicker.isUserInteractionEnabled = false
        textReminder.isUserInteractionEnabled = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
