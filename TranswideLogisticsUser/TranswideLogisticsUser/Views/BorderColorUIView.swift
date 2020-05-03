//
//  BorderColorUIView.swift
//  ZonaBouLoginForm
//
//  Created by apple on 9/13/19.
//  Copyright © 2019 apple. All rights reserved.
//


import UIKit

class BorderColorUIView : UIView {
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
