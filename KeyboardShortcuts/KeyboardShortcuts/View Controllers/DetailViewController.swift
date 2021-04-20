//
//  DetailViewController.swift
//  KeyboardShortcuts
//
//  Created by Ryan Grier on 4/9/21.
//

import UIKit

class DetailViewController: UIViewController {
    class var showDetailAlert: UIKeyCommand {
        return UIKeyCommand(title: "Show Detail",
                            action: #selector(detailViewAction),
                            input: "d",
                            modifierFlags: .command)
    }

    class var showInfoAlert: UIKeyCommand {
        return UIKeyCommand(title: "Show Info",
                            action: #selector(showInfo),
                            input: "i",
                            modifierFlags: .command)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // print is for demonstration purposes only.
        print("[DetailViewController] Responder Chain: \(_fullResponderChain)")
    }
    
    @objc private func detailViewAction() {
        let title = NSLocalizedString("Detail View Action", comment: "")
        let message = NSLocalizedString("This action was triggered from the detail view controller.", comment: "")
        
        let actionTitle = NSLocalizedString("Dismiss", comment: "")
        let dismissAction = UIAlertAction(title: actionTitle, style: .destructive, handler: nil)
        
        let alertController = AlertBuilder()
            .set(title: title, message: message)
            .add(action: dismissAction)
            .build()
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func showInfo() {
        // print is for demonstration purposes only. 
        print("DetailViewController - showInfo")
        
        let title = NSLocalizedString("Info", comment: "")
        let message = NSLocalizedString("This is the info", comment: "")
        let alertController = AlertBuilder()
            .set(title: title, message: message)
            .addOKAction()
            .build()
        
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - Keyboard Shortcuts

extension DetailViewController {
    override var keyCommands: [UIKeyCommand]? {
        return [DetailViewController.showInfoAlert, DetailViewController.showDetailAlert]
    }
}
