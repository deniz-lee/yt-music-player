//
//  AppDelegate.swift
//  YTMusicPlayer
//
//  Created by younggi.lee on 2022/09/20.
//
#if os(iOS)
import UIKit
#elseif os(OSX)
import Cocoa
#endif

import GoogleSignIn

@main
class AppDelegate: NSObject
{
#if os(iOS)
    internal var window: UIWindow?
#elseif os(OSX)
    internal var window: NSWindow?
#endif
}

fileprivate extension AppDelegate
{
    func applicationDidFinishLaunching()
    {
    }
}

extension AppDelegate: ApplicationDelegate
{
#if os(iOS)
    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        applicationDidFinishLaunching()
        return true
    }
    
    internal func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        var handled: Bool

          handled = GIDSignIn.sharedInstance.handle(url)
          if handled {
            return true
          }

          // Handle other custom URL types.

          // If not handled by this app, return false.
          return false
    }
    
#elseif os(OSX)
    internal func applicationDidFinishLaunching(_ aNotification: Notification)
    {
        applicationDidFinishLaunching()
        
//        let appleEventManager = NSAppleEventManager.shared()
//          appleEventManager.setEventHandler(
//            self,
//            andSelector: Selector("handleGetURLEvent(event:replyEvent:),
//            forEventClass: AEEventClass(kInternetEventClass),
//            andEventID: AEEventID(kAEGetURL)
//          )
    }
    
    @objc func handleGetURLEvent(event: NSAppleEventDescriptor?, replyEvent: NSAppleEventDescriptor?) {
        if let urlString =
          event?.paramDescriptor(forKeyword: AEKeyword(keyDirectObject))?.stringValue {
            
            
                print("handleGetURLEvent: \(urlString)")
            
            
            if let url = NSURL(string: urlString) as? URL
            {
                GIDSignIn.sharedInstance.handle(url)
            }
        }
    }
#endif
}
