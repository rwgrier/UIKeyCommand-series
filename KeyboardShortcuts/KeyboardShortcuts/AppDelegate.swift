//
//  AppDelegate.swift
//  KeyboardShortcuts
//
//  Created by Ryan Grier on 4/9/21.
//

import UIKit

extension UIMenu.Identifier {
    static var show = UIMenu.Identifier("show")
}

@main class AppDelegate: UIResponder {

    // Build the Catalyst (macOS) menu
    override func buildMenu(with builder: UIMenuBuilder) {
        super.buildMenu(with: builder)

        // Ignore the contextual menu builder.
        guard builder.system == .main else { return }

        // Remove some extra menus we don't need for this example.
        builder.remove(menu: .services)
        builder.remove(menu: .format)

        let menu = UIMenu(title: "Show",
                          identifier: .show,
                          options: .displayInline,
                          children: [TableViewController.showTableAlert,
                                     DetailViewController.showDetailAlert])


        builder.insertChild(menu, atStartOfMenu: .file)
    }
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
