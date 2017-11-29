//
//  TableViewController.swift
//  DynamicPrototypes
//
//  Created by Danillo on 29/11/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array = [Hi💧Score]()

    override func viewDidLoad() {
        super.viewDidLoad()
        array = Hi💧Score.generatorInstance(numberInstances: 5)
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "celxib")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section - \(section)"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celxib", for: indexPath)
        
        let custom = cell as! CustomTableViewCell
        custom.title.text = "Teste"
        
        let imgView = UIImageView(image: #imageLiteral(resourceName: "Cancel"))
        
        //cell.textLabel?.text = indexPath.section == 0 ? "Teste" : "Teste2"
        //cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        //cell.textLabel?.text = array[indexPath.row].name
        //cell.detailTextLabel?.text = array[indexPath.row].rating
        custom.textLabel?.text = array[indexPath.row].name
        custom.detailTextLabel?.text = array[indexPath.row].rating
        
        
        //cell.backgroundColor = UIColor.cyan
        //cell.accessoryView = imgView
        custom.backgroundColor = UIColor.cyan
        custom.accessoryView = imgView
        
        return cell
    }

}
