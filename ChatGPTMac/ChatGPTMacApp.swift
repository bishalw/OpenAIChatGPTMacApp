//
//  ChatGPTMacApp.swift
//  ChatGPTMac
//
//  Created by Bishalw on 12/17/22.
//

import SwiftUI

@main
struct ChatGPTMacApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ChatGPTView()
        }
    }
    class AppDelegate: NSObject, NSApplicationDelegate {
        
        private var statusItem: NSStatusItem!
        private var popover: NSPopover!
        
        @MainActor func applicationDidFinishLaunching(_ notification: Notification) {
            
            statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
            
            if let statusButton = statusItem.button {
                let imageName: String
                if NSApplication.shared.effectiveAppearance.bestMatch(from: [.darkAqua]) == .darkAqua {
                                  imageName = "openai-icon-dark"
                              } else {
                                  imageName = "openai-icon-light"
                              }

                              let image = NSImage(named: NSImage.Name(imageName))
                              statusButton.image = image
                              statusButton.action = #selector(togglePopover)
            }
            
            self.popover = NSPopover()
            setupPopover()
        }
        @objc func setupPopover(){
            
            popover.behavior = .transient
            popover.contentViewController = NSHostingController(rootView: ChatGPTView())
            
        }
        @objc func togglePopover() {
                
                
                if let button = statusItem.button {
                    if popover.isShown {
                        self.popover.performClose(nil)
                    } else {
                        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
                    }
                }
                
        }
        
        
    }
}
