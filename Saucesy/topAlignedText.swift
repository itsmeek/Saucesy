//
//  topAlignedText.swift
//  Saucesy
//
//  Created by Meeky Dekowski on 12/1/16.
//  Copyright © 2016 Meek Apps. All rights reserved.
//

import UIKit

class topAlignedText: UITextView {
    
    override func awakeFromNib() {
        self.textContainer.maximumNumberOfLines = 3
        self.textContainer.lineBreakMode = NSLineBreakMode.byTruncatingTail
        self.textContainer.lineFragmentPadding = 0
        self.textContainerInset = UIEdgeInsets.zero
    }
}
