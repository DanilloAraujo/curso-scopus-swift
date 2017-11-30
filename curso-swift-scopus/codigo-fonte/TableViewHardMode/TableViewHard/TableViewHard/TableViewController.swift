//
//  TableViewController.swift
//  TableViewHard
//
//  Created by Eduardo Pelorca on 29/11/17.
//  Copyright © 2017 Eduardo Pelorca. All rights reserved.
//

import UIKit
import DataKit
class TableViewController: UITableViewController {
    
    let maxSections = 5
    let maxRows = 15
    lazy var dataIcon:[Int:[Icon]] = [:]
    lazy var dataImage:[Int:[NetworkImage]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloFramework()
        self.dataIcon = generateIcons(maxSections, maxRows)
        self.dataImage = generateImages(maxSections, maxRows)
        self.tableView.isEditing = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.dataImage.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataImage[section]?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        let cell = (indexPath.row % 2) == 0 ? tableView.dequeueReusableCell(withIdentifier: "iconCell", for: indexPath) : tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
        //
        //        guard let content = self.dataIcon[indexPath.section]?[indexPath.row] else { return tableView.dequeueReusableCell(withIdentifier: "placeholder", for: indexPath) }
        //
        //
        //        cell.imageView?.image = UIImage(named: content.imageName)
        //
        //        cell.imageView?.image =  cell.imageView?.image?.withRenderingMode(.alwaysTemplate)
        //        cell.imageView?.tintColor = UIColor(displayP3Red: CGFloat(normalizedRamdon()), green: CGFloat(normalizedRamdon()), blue: CGFloat(normalizedRamdon()), alpha: 1.0)
        //
        //        if (indexPath.row % 2 != 0)  {
        //            guard let content = self.dataImage[indexPath.section]?[indexPath.row] else { return tableView.dequeueReusableCell(withIdentifier: "placeholder", for: indexPath) }
        //
        //            //cell.imageView?.downloadImage(url: URL(string: content.link)!)
        //            cell.imageView?.downloadImageAsync(url: URL(string: content.link)!)
        //        }
        //
        //        cell.detailTextLabel?.text = content.description
        //        cell.textLabel?.text = content.name
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        
        guard let content = self.dataImage[indexPath.section]?[indexPath.row] else { return tableView.dequeueReusableCell(withIdentifier: "placeholder", for: indexPath) }
        
        
        cell.cellImage?.downloadImageAsync(url: URL(string: content.link)!)
        cell.title.text = content.name
        cell.detail.text = content.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.dataImage[indexPath.section]?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.dataImage[sourceIndexPath.section]![sourceIndexPath.row]
        self.dataImage[sourceIndexPath.section]?.remove(at: sourceIndexPath.row)
        self.dataImage[destinationIndexPath.section]?.insert(movedObject, at: destinationIndexPath.row)
    }
    
}
