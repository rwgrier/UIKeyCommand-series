//
//  ViewController.swift
//  KeyboardShortcuts
//
//  Created by Ryan Grier on 4/15/21.
//

import UIKit

class ViewController: UIViewController {
    @objc private func showInfo() {
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

extension ViewController {
    override var keyCommands: [UIKeyCommand]? {
        let infoCommand = UIKeyCommand(title: "Show Info",
                                   action: #selector(showInfo),
                                   input: "i",
                                   modifierFlags: .command)

        return [infoCommand]
    }
}
