//
//  HomeWorkViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/20/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//
import UIKit
let defaults = UserDefaults(suiteName: "com.saving.data")

class HomeWorkViewController: UITableViewController {
  var rows = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Home Page"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        getData()
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        storeData()
    }
    
    @IBAction func backButton(_ sender: Any) {
         self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func addHomeWork(_ sender: Any) {
        addCell()
    }
    
    
    func storeData(){
        defaults?.set(rows, forKey: "savedData")
    }
    
    func getData(){
        rows = defaults!.array(forKey: "savedData") as? [String] ?? []
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeWork", for: indexPath)
        cell.textLabel?.text = rows[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            rows.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.storeData()
            //            tableView.reloadData()
        }else if editingStyle == .insert {
            
        }
    }
    
    func addCell(){
        let alert = UIAlertController(title: "Add Home Work", message: "Input text", preferredStyle: .alert)
        alert.addTextField{(textField) in
            textField.placeholder = "text...."
        }
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {[weak alert](_) in
            let row = alert?.textFields![0]
            self.rows.append((row?.text)!)
            self.tableView.reloadData()
            self.storeData()
        }))
        self.present(alert,animated: true, completion: nil)
        
    }
}
