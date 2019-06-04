//
//  ForgetPasswordViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/20/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var forgotPasswordTxtF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)
        // Do any additional setup after loading the view.
    }
    @IBAction func getPassword(_ sender: Any) {
        
        if forgotPasswordTxtF.text!.isEmpty {
            print("please enter a email")
            return
        }else {
            
            Auth.auth().sendPasswordReset(withEmail: forgotPasswordTxtF.text!) { (error) in
                if (error != nil){
                    print(error?.localizedDescription)
                    
                }else{
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func dismissActions(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
