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
        self.font  = UIFont(name:"Helvetica", size: 16)
        self.adjustsFontForContentSizeCategory = true
    }
}


extension UIImage {
       // image with rounded corners
       public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
           let maxRadius = min(size.width, size.height) / 2
           let cornerRadius: CGFloat
           if let radius = radius, radius > 0 && radius <= maxRadius {
               cornerRadius = radius
           } else {
               cornerRadius = maxRadius
           }
           UIGraphicsBeginImageContextWithOptions(size, false, scale)
           let rect = CGRect(origin: .zero, size: size)
           UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
           draw(in: rect)
           let image = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           return image
       }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)?.withRoundedCorners()
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
