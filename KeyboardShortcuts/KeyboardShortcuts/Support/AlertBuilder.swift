//
//  AlertBuilder.swift
//  KeyboardShortcuts
//
//  Created by Ryan Grier on 4/15/21.
//

import UIKit

class AlertBuilder {
    private(set) var actions: [UIAlertAction]
    private(set) var okAction: UIAlertAction?
    
    private(set) var title: String?
    private(set) var message: String?
    private(set) var style: UIAlertController.Style = .alert
    
    init() {
        actions = []
    }
    
    func set(title: String? = nil, message: String? = nil) -> Self {
        self.title = title
        self.message = message
        
        return self
    }
    
    func set(style: UIAlertController.Style) -> Self {
        self.style = style
        
        return self
    }
    
    func add(action: UIAlertAction) -> Self {
        actions.append(action)
        
        return self
    }
    
    func addOKAction(handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""),
                                 style: .default,
                                 handler: handler)
        
        return self
    }
    
    func build() -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        actions.forEach {
            alertController.addAction($0)
        }
        
        if let action = okAction {
            alertController.addAction(action)
        }

        return alertController
    }
}
