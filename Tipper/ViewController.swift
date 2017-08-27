//
//  ViewController.swift
//  Tipper
//
//  Created by Harsha Sabbineni on 8/25/17.
//  Copyright © 2017 Harsha Sabbineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()

        let defaults = UserDefaults.standard
        let billAmount = defaults.double(forKey: "billAmount")
        let billTime = defaults.object(forKey: "billTime") as? Date
        if((billTime) != nil) {
            let expiredMins = Calendar.current.dateComponents([.minute], from: billTime!, to: Date()).minute ?? 0
            print("Number of mins expired is \(expiredMins)")
            if(expiredMins < 10) {
                billField.text = String(format:"%0.2f", billAmount)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        loadUserDefaults()
        calculateTip(self)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    func loadUserDefaults() {
        let defaults = UserDefaults.standard
        let tipPercentage = defaults.double(forKey: "defaultTipPercentage")
        tipControl.selectedSegmentIndex = UIView().getIndexForSegmentSelection(tipPercentage: tipPercentage)
        
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billField.text!) ?? 0
        let tipPercentage = [0.18,0.20,0.25]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        
        // save bill amount in userdefaults
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "billAmount")
        defaults.set(Date(), forKey: "billTime")
        defaults.synchronize()
    }
}

