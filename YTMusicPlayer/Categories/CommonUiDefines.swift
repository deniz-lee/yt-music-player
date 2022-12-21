//
//  CommonUiDefines.swift
//  YTMusicPlayer
//
//  Created by younggi.lee on 2022/09/21.
//

#if os(iOS)
import UIKit

class Label: UILabel
{
    var value: String?
    {
        willSet(newValue)
        {
            self.text = newValue ?? ""
        }
    }
}

class Color: UIColor
{
    static func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor
    {
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

class Font: UIFont
{
    static func font(ofSize size: CGFloat) -> UIFont
    {
        return UIFont.systemFont(ofSize: size)
    }
}

class Window: UIWindow {}

class ViewController: UIViewController {}

protocol ApplicationDelegate: UIApplicationDelegate {}

#elseif os(OSX)
import Cocoa

class Label: NSTextField
{
    var value: String?
    {
        willSet(newValue)
        {
            self.stringValue = newValue ?? ""
        }
    }
}

class Color: NSColor
{
    static func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> NSColor
    {
        return NSColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

class Font: NSFont
{
    static func font(ofSize size: CGFloat) -> NSFont
    {
        return NSFont.systemFont(ofSize: size)
    }
}

class Window: NSWindow {}

class ViewController: NSViewController {}

protocol ApplicationDelegate: NSApplicationDelegate {}
#endif
