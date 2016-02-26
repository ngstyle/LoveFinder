//
//  ViewController.swift
//  LoveFinder
//
//  Created by chon on 16/2/21.
//  Copyright © 2016年 chon. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var heightNum: UILabel!
    
    @IBOutlet weak var hasProperty: UISwitch!
    
    @IBOutlet weak var result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func heightChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        let i = Int(slider.value)
        slider.value = Float(i)
        heightNum.text = "\(i)厘米"
    }

    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex == 0 ? "公的" : "母的"
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        
        let componets = gregorian?.components(NSCalendarUnit.Year, fromDate: birthday.date, toDate: now, options: NSCalendarOptions(rawValue:0));
        
        let age = componets?.year
        
        let hasPropertyText = hasProperty.on ? "有房" : "没房"
        
        result.text = "\(name.text!),\(genderText),今年\(age)岁了，身高\(heightNum.text),\(hasPropertyText)，求交往！"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        name.resignFirstResponder()
        return true
    }

}

