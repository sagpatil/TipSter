//
//  ViewController.swift
//  Tipster
//
//  Created by Patil, Sagar on 8/13/14.
//  Copyright (c) 2014 Patil, Sagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegControl: UISegmentedControl!
    
    @IBOutlet weak var totalByTwo: UILabel!
    @IBOutlet weak var totalByThree: UILabel!
    @IBOutlet weak var totalByFour: UILabel!
    
    @IBOutlet weak var tipView: UIView!
    var billCentre: CGPoint = CGPointMake(0.0,0.0)
    var tipCentre: CGPoint = CGPointMake(0.0,0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipCentre = tipView.center
        tipView.center = CGPointMake(tipView.center.x, tipView.center.y + 400)
        billField.becomeFirstResponder()
        
        billCentre = billField.center
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = (billField.text as NSString).doubleValue
        if(billAmount > 0)
        {
            UIView .animateWithDuration(0.1, animations: { () -> Void in
                self.billField.center = CGPointMake(self.billCentre.x, self.billCentre.y-50)
                self.tipView.center = self.tipCentre
            })
        }
        else{
            
            UIView .animateWithDuration(0.1, animations: { () -> Void in
                self.billField.center = self.billCentre;
                self.tipView.center = CGPointMake(self.tipCentre.x, self.tipCentre.y + 400)
            })
        }
        
        
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercent:Double
        tipPercent  = tipPercentages[tipSegControl.selectedSegmentIndex]
        
        
        var tip =  billAmount * tipPercent
        var total = tip + billAmount
        println("\(billAmount)   \(tip) \(tipPercent)  \(total)")
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalByTwo.text = String(format: "$%.2f", total/2)
        totalByThree.text = String(format: "$%.2f", total/3)
        totalByFour.text = String(format: "$%.2f", total/4)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

