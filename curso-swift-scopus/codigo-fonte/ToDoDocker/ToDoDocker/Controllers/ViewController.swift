//
//  ViewController.swift
//  ToDoDocker
//
//  Created by Danillo on 06/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
import BFKit
import MBProgressHUD
import SwiftMessages

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: Any) {
        guard !(self.userName.text?.isEmpty)! && !(self.password.text?.isEmpty)! else {
            return
        }
        postRequest()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postRequest() {
        //show loading
        self.showLoading()
        LoginService().getLogin(username: self.userName.text!,password: self.password.text!, onSuccess: { response in
            if response?.httpStatusCode == 200 {
                loginModel = (response?.body)!
                self.segueToTasks()
            }
            
        }, onError: { error in
            
            if error?.httpResponseCode == 401 {
                SwiftMessages.show {
                    let view = MessageView.viewFromNib(layout: MessageView.Layout.cardView)
                    view.configureContent(title: "Erro ao efetuar login", body: "Dados inválidos!")
                    view.button?.isHidden = true
                    view.configureTheme(Theme.error)
                    view.configureDropShadow()
                    return view
                }
            }
        }, always: {
            //hide loading
            self.hideLoading()
        })
        
    }
    
    func segueToTasks() {
        self.performSegue(withIdentifier: "tasks", sender: self)
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

