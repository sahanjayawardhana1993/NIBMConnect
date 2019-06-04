//
//  StudentViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/20/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Kingfisher


class StudentViewController: UIViewController{
    
    var ref: DatabaseReference!
    var friendList:[Friends] = []
    var passFriend:Friends? = nil
    
    @IBOutlet weak var studentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
            self.ref.child("students").observeSingleEvent(of: .value) { (snapshot) in
                //get user value
                
                let value = snapshot.value as? NSDictionary
                var friends:[Friends] = []
                
                if snapshot.childrenCount > 0 {
                    for friend in snapshot.children.allObjects as! [DataSnapshot]{
                        
                        let friendObject = friend.value as? [String:AnyObject]
                        let fri = Friends(id: friendObject!["id"] as! String, fName: friendObject!["fName"] as! String, lName: friendObject!["lName"] as! String, fBLink: friendObject!["fbLink"] as! String, ph: friendObject!["phone"] as! String, bir: friendObject!["birth"] as! String, pf: friendObject!["pf"] as! String, city: friendObject!["city"] as! String)
                        
                        friends.append(fri)
                    }
                }
                self.friendList = friends
                self.studentTableView.reloadData()
                
            
        }
        
    

        self.studentTableView.delegate = self
        self.studentTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        //self.performSegue(withIdentifier: "Home", sender: self)
        self.dismiss(animated: false, completion: nil)
    }

}

extension StudentViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:friendCell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)  as! friendCell
        
        let friend = friendList[indexPath.row]
        
        cell.firstName.text = friend.firstName
        cell.lastName.text = friend.lastName
        cell.cityName.text = friend.city
        let url = URL(string: self.friendList[indexPath.row].pf)
        cell.pfIMage.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passFriend = friendList[indexPath.row]
        performSegue(withIdentifier: "goToProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfile" {
            if let ViewController = segue.destination as? friendViewController {
               ViewController.passFriend = passFriend
            }
            
        }
    }
    
    
}
