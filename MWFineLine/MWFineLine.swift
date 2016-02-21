//
//  MWFineLine.swift
//  MWFineLine
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Mark Woollard
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

// MWFineLine is a simple UIView subclass that sizes to one physical pixel for the current
// display size in either the horizontal or vertical direction. Supports IBDesignable so
// can be configured in IB.
@IBDesignable
public class MWFineLine : UIView {
    
    private var inInterfaceBuilder = false
    
    // Inspectable property indicating whether line is horizontal or vertical, default is
    // horizontal
    @IBInspectable var isHorizontal:Bool = true {
        didSet {
            if oldValue != self.isHorizontal {
                self.invalidateIntrinsicContentSize()
            }
        }
    }
    
    override public func intrinsicContentSize() -> CGSize {
        let fineLine:CGFloat = self.inInterfaceBuilder ? 1.0 : 1.0 / self.traitCollection.displayScale
        if self.isHorizontal {
            return CGSizeMake(UIViewNoIntrinsicMetric, fineLine)
        } else {
            return CGSizeMake(fineLine, UIViewNoIntrinsicMetric)
        }
    }
    
    override public func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.invalidateIntrinsicContentSize()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.inInterfaceBuilder = true
    }
}
