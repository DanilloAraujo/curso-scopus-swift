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
    @IBOutlet weak var taskDescription: UITextView!
    
    var taskResult = Result()
    var editTask = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTitle.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if editTask {
            taskTitle.text = taskResult.title
            taskDescription.text = taskResult.desc
            taskComplete.isOn = taskResult.isComplete!
        }
    }
    
    
    @IBAction func saveTask(_ sender: Any) {
        taskResult.title = taskTitle.text
        taskResult.desc = taskDescription.text
        taskResult.isComplete = taskComplete.isOn
        taskResult.expirationDate = "2017-12-14"
        
        if editTask {
            edit()
        } else {
            save()
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func save() {
        self.showLoading()
        TasksService().saveTask(task: self.taskResult, onSuccess: { response in
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
            self.hideLoading()
        })
    }
    
    func edit() {
        self.showLoading()
        TasksService().editTask(task: self.taskResult, onSuccess: { response in
            SwiftMessages.show {
                let view = MessageView.viewFromNib(layout: MessageView.Layout.cardView)
                view.configureContent(title: "Sucesso", body: "Task editada com sucesso!")
                view.button?.isHidden = true
                view.configureTheme(Theme.success)
                view.configureDropShadow()
                return view
            }
        }, onError: { error in
            SwiftMessages.show {
                let view = MessageView.viewFromNib(layout: MessageView.Layout.cardView)
                view.configureContent(title: "Erro", body: "Ocorreu um erro a editar a task.")
                view.button?.isHidden = true
                view.configureTheme(Theme.error)
                view.configureDropShadow()
                return view
            }
        }, always: {
            self.hideLoading()
        })
    }
}
