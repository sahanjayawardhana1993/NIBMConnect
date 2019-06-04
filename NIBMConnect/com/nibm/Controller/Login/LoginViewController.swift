//
//  LoginViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/20/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxtF: UITextField!
    @IBOutlet weak var passwordTxtF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        if emailTxtF.text!.isEmpty || passwordTxtF.text!.isEmpty {
            print("Please enter email or password")
        }else{
            
            Auth.auth().signIn(withEmail: emailTxtF.text!, password: passwordTxtF.text!) { [weak self] user, error in
                guard let strongSelf = self else { return }
                
                if (error != nil){
                    print("Error")
                }else{
                    strongSelf.performSegue(withIdentifier: "goToHome", sender: self)
                }
            }
        }
    }
    
}
