//
//  ViewController.swift
//  Gratuity
//
//  Created by Nicolas Bories on 12/29/14.
//  Copyright (c) 2014 nico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        self.billField.becomeFirstResponder()
        self.tipControl.alpha = 0
        self.totalView.alpha = 0
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        UIView.animateWithDuration(0.3, animations: {
            self.tipControl.alpha = 1
            self.totalView.alpha = 1
            self.descriptionLabel.alpha = 0
            self.billField.frame = CGRectMake(20,88,280,52)
            self.totalView.frame = CGRectMake(0,214,320,354)
            self.tipControl.frame = CGRectMake(15,165,290,29)
        })
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
}

