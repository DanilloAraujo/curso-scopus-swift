//
//  NewTaskController.swift
//  ToDoDocker
//
//  Created by Danillo on 07/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
import BFKit
import MBProgressHUD
import SwiftMessages

class NewTaskController: UIViewController {
    
    @IBOutlet weak var taskComplete: UISwitch!
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var taskDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveTask(_ sender: Any) {
        save()
    }
    
    func save() {
        TasksService().saveTask(title: self.taskTitle.text!, description: self.taskDescription.text!, expirationDate: "2017-12-14", complete: self.taskComplete.isOn, onSuccess: { response in
            
            SwiftMessages.show {
                let view = MessageView.viewFromNib(layout: MessageView.Layout.cardView)
                view.configureContent(title: "Sucesso", body: "Task criada com sucesso!")
                view.button?.isHidden = true
                view.configureTheme(Theme.success)
                view.configureDropShadow()
                return view
            }
        }, onError: { error in
            SwiftMessages.show {
                let view = MessageView.viewFromNib(layout: MessageView.Layout.cardView)
                view.configureContent(title: "Erro", body: "Ocorreu um erro a incluir task.")
                view.button?.isHidden = true
                view.configureTheme(Theme.error)
                view.configureDropShadow()
                return view
            }
        }, always: {
            
        })
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
