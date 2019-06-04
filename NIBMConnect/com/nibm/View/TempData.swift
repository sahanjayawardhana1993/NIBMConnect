//
//  File.swift
//  NIBMConnect
//
//  Created by Akila Dilshan on 5/22/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TempAppData{
    static var userHandle:AuthStateDidChangeListenerHandle?
}

extension UIView{
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor){
        //CAGradientLayer obeject create
        let gradientLayer = CAGradientLayer()
        //set entire background
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

