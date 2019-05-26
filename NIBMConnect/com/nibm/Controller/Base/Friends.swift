//
//  friends.swift
//  NIBMConnect
//
//  Created by Akila Dilshan on 5/22/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import Foundation

class Friends {
    
    var id:String
    var firstName:String
    var lastName:String
    var fbLink:String
    var phoneNum:String
    var birthDay:String
    var pf:String
    var city:String
    
    init(id:String, fName:String, lName:String, fBLink:String, ph:String, bir:String, pf:String, city:String) {
        
        self.id  = id
        self.firstName = fName
        self.lastName = lName
        self.fbLink = fBLink
        self.phoneNum = ph
        self.birthDay = bir
        self.pf = pf
        self.city = city
    }
}
