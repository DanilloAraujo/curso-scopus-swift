//
//  DetailController.swift
//  TrabalhoFinal
//
//  Created by Danillo on 01/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
import EventKit

class DetailController: UIViewController {

    var selectedItem: (title: String, description: String, date: Date)?
    
    @IBOutlet weak var textReminder: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
