//
//  TasksTableViewController.swift
//  ToDoDocker
//
//  Created by Danillo on 07/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
import SwiftMessages

class TasksTableViewController: UITableViewController {
    
    var tasks = Tasks()
    var taskSelected = Result()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "taskCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTasks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TasksCell
        
        let content = tasks.results![indexPath.row]
        cell.lblTitle.text = content.title
        cell.lblDetail.text = content.desc
        cell.lblDate.text = content.expirationDate
        cell.imgComplete.isHidden = !content.isComplete!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.taskSelected = tasks.results![indexPath.row]
        self.tableView.deselectRow(at: indexPath, animated: false)
        self.performSegue(withIdentifier: "editTask", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? NewTaskController {
            if segue.identifier == "editTask" {
                dest.editTask = true
                dest.taskResult = self.taskSelected
            }
        }
    }
    
    func getTasks() {
        
        self.showLoading()
        TasksService().getTasks(
            onSuccess: {response in
                if response?.httpStatusCode == 200{
                    self.tasks = (response?.body)!
                    self.tableView.reloadData()
                }
        },
            onError: { error in
                SwiftMessages.show {
                    let view = MessageView.viewFromNib(layout: MessageView.Layout.cardView)
                    view.configureContent(title: "Erro", body: "Não foi possível recuperar as Tasks!")
                    view.button?.isHidden = true
                    view.configureTheme(Theme.error)
                    view.configureDropShadow()
                    return view
                }},
            always: {
                self.hideLoading()
        })
    }
    
}