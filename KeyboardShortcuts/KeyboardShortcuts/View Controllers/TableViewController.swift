//
//  TableViewController.swift
//  KeyboardShortcuts
//
//  Created by Ryan Grier on 4/9/21.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // print is for demonstration purposes only.
        print("[TableViewController] Responder Chain: \(_fullResponderChain)")
    }
    
    @objc private func tableViewAction() {
        let title = NSLocalizedString("Table View Action", comment: "")
        let message = NSLocalizedString("This action was triggered from the table view controller.", comment: "")
        
        let actionTitle = NSLocalizedString("Cancel", comment: "")
        let cancelAction = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
        
        let alertController = AlertBuilder()
            .set(title: title, message: message)
            .add(action: cancelAction)
            .build()
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func showInfo() {
        // print is for demonstration purposes only.
        print("TableViewController - showInfo")
        
        let title = NSLocalizedString("Info", comment: "")
        let message = NSLocalizedString("This is the info", comment: "")
        let alertController = AlertBuilder()
            .set(title: title, message: message)
            .addOKAction()
            .build()
        
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension TableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = "\(indexPath.section): \(indexPath.row)"

        return cell
    }
}

// MARK: - Keyboard Shortcuts

extension TableViewController {
    override var keyCommands: [UIKeyCommand]? {
        let infoCommand = UIKeyCommand(title: "Show Info",
                                   action: #selector(showInfo),
                                   input: "i",
                                   modifierFlags: .command)
        
        let tableCommand = UIKeyCommand(title: "Show Table",
                                   action: #selector(tableViewAction),
                                   input: "t",
                                   modifierFlags: .command)
        
        return [infoCommand, tableCommand]
    }
}
