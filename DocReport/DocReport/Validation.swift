//
//  Validation.swift
//  DocReport
//
//  Created by Albin on 30/08/16.
//  Copyright © 2016 Albin. All rights reserved.
//

import UIKit


struct Validation{
    
   static func Text(TextOnly: String,Min:Int,Max:Int,ErrorMessage:String,TextFeildName:UITextField,SelfView:UIViewController) -> Bool {
        //        let TextRegex = ".*"
        if(TextOnly.characters.count >= Min && TextOnly.characters.count <= Max){
            return true
        }else{
            return false
        }
        
    }
}