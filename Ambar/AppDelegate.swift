//
//  AppDelegate.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @StateObject var PreferencesObj = PreferencesClass()
    var preferencesWindow: NSWindow!    // << here
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    let persistenceController = PersistenceController.shared
    

    
    
    @objc func openPreferencesWindow() {
           if nil == preferencesWindow {      // create once !!
//               let preferencesView = AddView()
               // Create the preferences window and set content
               preferencesWindow = NSWindow(
                   contentRect: NSRect(x: 20, y: 20, width: 480, height: 350),
                   styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                   backing: .buffered,
                   defer: false)
               preferencesWindow.center()
               preferencesWindow.setFrameAutosaveName("Preferences")
               preferencesWindow.isReleasedWhenClosed = false
            preferencesWindow.contentView = NSHostingView(rootView: DefaultView().environment(\.managedObjectContext, persistenceController.container.viewContext))
            preferencesWindow.level = .floating
           }
           preferencesWindow.makeKeyAndOrderFront(nil)
       }
    
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the contents
        
    
     let contentView = ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        PreferencesClass.init()

        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.contentViewController = MainViewController()
        popover.contentSize = NSSize(width: 360, height: 360)
        popover.contentViewController?.view = NSHostingView(rootView: contentView)
        
      // Create the Status Bar Item with the Popover
        statusBar = StatusBarController.init(popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
