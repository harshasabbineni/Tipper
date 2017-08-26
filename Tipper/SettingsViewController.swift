//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Harsha Sabbineni on 8/25/17.
//  Copyright © 2017 Harsha Sabbineni. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaultTipPercentage = UserDefaults.standard.object(forKey: "defaultTipPercentage")
        if(defaultTipPercentage != nil) {
            defaultTipControl.selectedSegmentIndex = UIView().getIndexForSegmentSelection(tipPercentage: defaultTipPercentage as! Double)
        }
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let tipPercentage = [0.18, 0.20, 0.25]
        let defaults = UserDefaults.standard
        defaults.set(tipPercentage[defaultTipControl.selectedSegmentIndex], forKey: "defaultTipPercentage")
        defaults.synchronize()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
