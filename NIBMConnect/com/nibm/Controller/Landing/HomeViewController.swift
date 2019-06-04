//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/19/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        TempAppData.userHandle = Auth.auth().addStateDidChangeListener {(auth, user) in
            
            if user != nil {
                
                self.performSegue(withIdentifier: "gotohome", sender: self)
            }else{
                self.performSegue(withIdentifier: "gotologin", sender: self)
                
            }
            
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        Auth.auth().removeStateDidChangeListener(TempAppData.userHandle!)
    }
}
