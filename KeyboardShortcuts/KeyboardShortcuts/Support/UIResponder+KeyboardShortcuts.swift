//
//  UIResponder+KeyboardShortcuts.swift
//  KeyboardShortcuts
//
//  Created by Ryan Grier on 4/12/21.
//

import UIKit

extension UIResponder {
    var _className: String {
        return NSStringFromClass(self.classForCoder)
    }
    
    var _fullResponderChain: String {
        guard let nextResponder = next else {
            return _className
        }
        
        return _className + " => " + nextResponder._fullResponderChain
    }
}
