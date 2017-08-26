//
//  UIViewUtils.swift
//  Tipper
//
//  Created by Harsha Sabbineni on 8/25/17.
//  Copyright © 2017 Harsha Sabbineni. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func getIndexForSegmentSelection(tipPercentage: Double) -> Int {
        switch(tipPercentage) {
        case (0.18) :
            return 0
        case (0.20):
            return 1
        case (0.25):
            return 2
        default:
            print("Unsupported value, setting to tip percentage to 18%")
            return 0
        }
    }
    
    func userDefaultKeyExists(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: "defaultTipPercentage") != nil
    }
}
