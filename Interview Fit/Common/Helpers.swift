//
//  Helpers.swift
//  Interview Fit
//
//  Created by Moises Lugo Aguilar on 23/01/23.
//

import Foundation
import UIKit

//MARK: View Extensions


extension UIView {
    
    func addShadowView() {
        //Remove previous shadow views
        superview?.viewWithTag(119900)?.removeFromSuperview()
        
        //Create new shadow view with frame
        let shadowView = UIView(frame: frame)
        shadowView.tag = 119900
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 3)
        shadowView.layer.masksToBounds = false
        
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = 3
        shadowView.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        shadowView.layer.rasterizationScale = UIScreen.main.scale
        shadowView.layer.shouldRasterize = true
        
        superview?.insertSubview(shadowView, belowSubview: self)
    }
    
    
    func dropShadow(scale: Bool = true) {
        layer.cornerRadius = 15
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 1, height: 0.5)
        layer.shadowColor = UIColor.lightGray.cgColor
    }
}

//MARK: KeyboardHide

//if someone use it...

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: SameType

extension UITextView {
    func setFontTextViewAccessibility() {
        self.font  = UIFont(name:"fontname", size: 20.0)
        self.adjustsFontForContentSizeCategory = true
    }
}

extension UITextField {
    func setAccessibility(fontSize : UIFont.TextStyle) {
        self.font = .preferredFont(forTextStyle: fontSize)
        self.adjustsFontForContentSizeCategory = true
    }
}

extension UILabel {
    func setFontLabelAccessibility() {
        self.font  = UIFont(name:"Helvetica", size: 17)
        self.adjustsFontForContentSizeCategory = true
    }
}
