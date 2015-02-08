//
//  ColorHelper.swift
//  Plan
//
//  Created by Tony on 15/2/6.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

import Foundation
import UIKit

class ColorHelper: NSObject {
    
    class func getCGColorByRGB(colorValue: Int) -> CGColor {
        
        let redFolat = (CGFloat)((Float)((colorValue & 0xFF0000) >> 16)) / 255.0
        let greenFolat = (CGFloat)((Float)((colorValue & 0xFF00) >> 8)) / 255.0
        let blueFolat = (CGFloat)((Float)(colorValue & 0xFF)) / 255.0
        return UIColor(red:  redFolat, green: greenFolat, blue: blueFolat, alpha: 1.0).CGColor
    }
    
}
