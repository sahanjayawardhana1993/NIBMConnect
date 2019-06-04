//
//  friendViewController.swift
//  NIBMConnect
//
//  Created by Akila Dilshan on 5/25/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import UIKit

class friendViewController: UIViewController {
    
    var passFriend:Friends? = nil
    @IBOutlet weak var fname: UILabel!
    @IBOutlet weak var lname: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var phoneNUm: UILabel!
    @IBOutlet weak var fbLink: UILabel!
    @IBOutlet weak var proImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fname.text = passFriend?.firstName
        self.lname.text = passFriend?.lastName
        self.city.text = passFriend?.city
        self.birthday.text = passFriend?.birthDay
        self.phoneNUm.text = passFriend?.phoneNum
        self.fbLink.text = passFriend?.fbLink
        let url = URL(string: passFriend!.pf)
        proImg.kf.setImage(with: url)
        
    }
    

}
