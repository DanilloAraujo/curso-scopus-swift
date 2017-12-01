//
//  ViewController.swift
//  TrabalhoFinal
//
//  Created by Danillo on 01/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UITableViewController, UISearchBarDelegate {

    var selectedItem: (title: String, description: String, date: Date)?
    lazy var originalList: [(title: String, description: String, date: Date)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        originalList = list
        tableView.reloadData()
    }
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        return list.count
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lembreteCell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row].title
        cell.detailTextLabel?.text = list[indexPath.row].description
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DetailController {
            dest.selectedItem = selectedItem
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        selectedItem = list[indexPath.row]
        self.performSegue(withIdentifier: "todetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            list = originalList
            self.tableView.reloadData()
            return
        }
        
        list = []
        
        for (title, description, date) in originalList {
            
            if (title.range(of: searchText) != nil) {
                list.append((title, description, date))
            }
            
        }
        
        self.tableView.reloadData()
    }
    

}

