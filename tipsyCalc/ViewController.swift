//
//  ViewController.swift
//  tipsyCalc
//
//  Created by Chris Mikelson on 9/13/15.
//  Copyright (c) 2015 Chris Mikelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var twoPersonTip: UILabel!
    @IBOutlet weak var threePersonTip: UILabel!
    @IBOutlet weak var fourPersonTip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        twoPersonTip.text = "$0.00"
        threePersonTip.text = "$0.00"
        fourPersonTip.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillChanged(sender: AnyObject) {
        
        var tipPercentages = [0.1, 0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        twoPersonTip.text = "$\(total / 2)"
        threePersonTip.text = "$\(total / 3)"
        fourPersonTip.text = "$\(total / 4)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoPersonTip.text = String(format: "$%.2f", total / 2)
        threePersonTip.text = String(format: "$%.2f", total / 3)
        fourPersonTip.text = String(format: "$%.2f", total / 4)
    }

    @IBAction func onTapHideKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
}

