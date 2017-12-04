//
//  NewController.swift
//  TrabalhoFinal
//
//  Created by Danillo on 01/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit

class NewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textReminder: UITextView!
    @IBOutlet weak var titleReminder: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textReminder.text = "Digite aqui a descricao"
        textReminder.textColor = UIColor.lightGray
        titleReminder.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        if !checkForErrors() {
            var dados :[(title: String, description: String, date: Date)] = []
            dados.append((title: titleReminder.text!, description: textReminder.text, date: datePicker.date))
            list.append(contentsOf: dados)
            let alert = UIAlertController(title: "Informação", message: "Lembrete salvo com sucesso!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textReminder.textColor == UIColor.lightGray {
            textReminder.text = nil
            textReminder.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textReminder.text.isEmpty {
            textReminder.text = "Digite aqui a descricao"
            textReminder.textColor = UIColor.lightGray
        }
    }
    
    func checkForErrors () -> Bool {
        var errors = false
        let title = "Alerta"
        var message = ""
        if (titleReminder.text?.isEmpty)! {
            errors = true
            message += "Informe o título!"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.titleReminder.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
            
        } else if textReminder.text.isEmpty || textReminder.textColor == UIColor.lightGray {
            errors = true
            message += "Informe a descrição!"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.textReminder.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        return errors
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
