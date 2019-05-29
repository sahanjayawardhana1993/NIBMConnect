//
//  BaseViewController.swift
//  NIBMConnect
//
//  Created by Akila Dilshan on 5/22/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import UIKit
import LocalAuthentication


class BaseViewController: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var homeWorkButton: UIButton!
    @IBOutlet weak var friendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)
        
        profileButton.backgroundColor = .clear
        profileButton.layer.cornerRadius = 15
        profileButton.layer.borderWidth = 2
        profileButton.layer.borderColor = UIColor.white.cgColor
        
        homeWorkButton.backgroundColor = .clear
        homeWorkButton.layer.cornerRadius = 15
        homeWorkButton.layer.borderWidth = 2
        homeWorkButton.layer.borderColor = UIColor.white.cgColor
        
        friendButton.backgroundColor = .clear
        friendButton.layer.cornerRadius = 15
        friendButton.layer.borderWidth = 2
        friendButton.layer.borderColor = UIColor.white.cgColor
    }
  
    @IBAction func goToProfile(_ sender: Any) {
        
        let myContext = LAContext()
        let myLocalizedReasonString = "NiBM Connect"
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.performSegue(withIdentifier: "showMyProfile", sender: self)
                            
                        } else {
                            
                            let err = evaluateError?.localizedDescription
                            print(err)
                        }
                    }
                }
            } else {
                print("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            print("Sorry!!.. Could not evaluate policy.")
        }
        
    }
    
    @IBAction func homeView(_ sender: Any) {
           self.performSegue(withIdentifier: "showHomeWork", sender: nil)
    }
    
    
    @IBAction func friendsView(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showStudent", sender: self)
    }
}
