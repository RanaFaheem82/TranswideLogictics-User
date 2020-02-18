//
//  Extension.swift
//  WrestlerBlower
//
//  Created by Rapidzz Macbook on 05/09/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    var parentViewController: UIViewController? {
           var parentResponder: UIResponder? = self
           while parentResponder != nil {
               parentResponder = parentResponder!.next
               if let viewController = parentResponder as? UIViewController {
                   return viewController
               }
           }
           return nil
       }
       
       var snapshot: UIImage {
           UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
           drawHierarchy(in: bounds, afterScreenUpdates: false)
           let result = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           return result!
       }
       
       class func fromNib<T : UIView>() -> T {
           return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
       }
    
}


extension UITextField {
    @IBInspectable var textInsets: CGPoint {
        get {
            return CGPoint.zero
        }
        set {
            layer.sublayerTransform = CATransform3DMakeTranslation(newValue.x, newValue.y, 0);
        }
    }
}


open class CustomLabel : UILabel {
    @IBInspectable open var characterSpacing:CGFloat = 1 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
        
    }
}
class UIButtonWithSpacing : UIButton
{
    override func setTitle(_ title: String?, for state: UIControl.State)
    {
        if let title = title, spacing != 0
        {
            let color = super.titleColor(for: state) ?? UIColor.black
            let attributedTitle = NSAttributedString(
                string: title,
                attributes: [NSAttributedString.Key.kern: spacing,
                             NSAttributedString.Key.foregroundColor: color])
            super.setAttributedTitle(attributedTitle, for: state)
        }
        else
        {
            super.setTitle(title, for: state)
        }
    }
    
    fileprivate func updateTitleLabel_()
    {
        let states:[UIControl.State] = [.normal, .highlighted, .selected, .disabled]
        for state in states
        {
            let currentText = super.title(for: state)
            self.setTitle(currentText, for: state)
        }
    }
    
    @IBInspectable var spacing:CGFloat = 0 {
        didSet {
            updateTitleLabel_()
        }
    }
}

extension Notification.Name {
    static let EvidenceAddedSuccessfully = Notification.Name("EvidenceAddedSuccessfully")
    static let StatusChangedNotification = Notification.Name("StatusChangedNotification")
}
extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
