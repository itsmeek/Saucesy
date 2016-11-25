//
//  dropShadow.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 11/25/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import UIKit

class dropShadow: UIView {

    override func awakeFromNib() {
        
        let grey: CGFloat = 190/225
        
        self.layer.shadowColor = UIColor(red: grey, green: grey, blue: grey, alpha: 1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius = 0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
        self.layer.shouldRasterize = true
    }

}
