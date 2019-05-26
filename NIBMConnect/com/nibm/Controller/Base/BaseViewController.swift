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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func friendsView(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showStudent", sender: self)
    }
}
