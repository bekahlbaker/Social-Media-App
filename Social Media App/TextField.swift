//
//  TextField.swift
//  Social Media App
//
//  Created by Rebekah Baker on 10/26/16.
//  Copyright © 2016 Rebekah Baker. All rights reserved.
//

import UIKit

class TextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red:0.74, green:0.74, blue:0.74, alpha:0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0

    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15, dy: 5)
    }
}
