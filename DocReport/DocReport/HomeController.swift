//
//  ViewController.swift
//  DocReport
//
//  Created by Albin on 29/08/16.
//  Copyright © 2016 Albin. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    
    
    @IBOutlet weak var nameTextInput: UITextField!
    @IBOutlet weak var ageTextInput: UITextField!
    
    @IBOutlet weak var maleCheckBox: UIButton!
    @IBOutlet weak var femaleCheckBox: UIButton!
    
    @IBOutlet weak var diabeticYesCheckBox: UIButton!
    @IBOutlet weak var diabeticNoCheckBox: UIButton!
    
    @IBOutlet weak var breathingIssueYesCheckBox: UIButton!
    @IBOutlet weak var breathingIssueNoCheckBox: UIButton!
    
    @IBOutlet weak var errorMessage: UILabel!
    
    var sex:Bool?
    var diabetic:Bool?
    var breathingIssue:Bool?
    
    let coredataManager = CoreDataManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maleCheckBox.tag = 1
        femaleCheckBox.tag = 2
        
        diabeticYesCheckBox.tag = 1
        diabeticNoCheckBox.tag = 2
        
        breathingIssueYesCheckBox.tag = 1
        breathingIssueNoCheckBox.tag = 2
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func sexButtonAction(sender: AnyObject) {
        
        if sender.tag == 1{
            
            maleCheckBox.selected = true
            femaleCheckBox.selected = false
            self.sex = true
        }else{
            
            maleCheckBox.selected = false
            femaleCheckBox.selected = true
            self.sex = false
        }
        
    }
    
    @IBAction func diabeticButtonAction(sender: AnyObject) {
        
        if sender.tag == 1{
            
            diabeticYesCheckBox.selected = true
            diabeticNoCheckBox.selected = false
            self.diabetic = true
        }else{
            
            diabeticYesCheckBox.selected = false
            diabeticNoCheckBox.selected = true
            self.diabetic = false
        }
        
    }
    
    @IBAction func breathingIssueButtonAction(sender: AnyObject) {
        
        if sender.tag == 1{
            
            breathingIssueYesCheckBox.selected = true
            breathingIssueNoCheckBox.selected = false
            self.breathingIssue = true
        }else{
            
            breathingIssueYesCheckBox.selected = false
            breathingIssueNoCheckBox.selected = true
            self.breathingIssue = false
        }
        
        
    }
    
    
    @IBAction func saveData(sender: AnyObject) {
        
        if nameTextInput.text == "" || nameTextInput.text!.characters.count < 2{
            errorMessage.text = "Please enter valid name"
            return
        }else if ageTextInput.text == "" || Int(ageTextInput.text!) == nil || Int(ageTextInput.text!) > 120 {
            errorMessage.text = "Please enter valid age"
            return
        }else if sex == nil{
            errorMessage.text = "Please select sex"
            return
        }else if diabetic == nil{
            errorMessage.text = "Please select diabetic status"
            return
        }else if breathingIssue == nil{
            errorMessage.text = "Please select breathing issue status"
            return
        }else{
            errorMessage.text = ""
            var listModelObject = [String:AnyObject]()
            
            listModelObject["name"] = nameTextInput.text!
            listModelObject["age"] = Int(ageTextInput.text!)
            listModelObject["diabetic"] = diabetic
            listModelObject["breathingissue"] = breathingIssue
            listModelObject["sex"] = sex
            
            coredataManager.createList(listModelObject)
            
            errorMessage.text = "Saved successfully"
        }
        
        
        
    }
    
    
    
}

