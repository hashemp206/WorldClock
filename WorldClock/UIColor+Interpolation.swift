//
//  UIColor+Interpolation.swift
//  WorldClock
//
//  Created by Hashem on 7/22/16.
//  Copyright © 2016 Abounajmi. All rights reserved.
//

struct ColorComponents {
    var r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat
}

extension UIColor {
    
    func getComponents() -> ColorComponents {
        if (CGColorGetNumberOfComponents(self.CGColor) == 2) {
            let cc = CGColorGetComponents(self.CGColor);
            return ColorComponents(r:cc[0], g:cc[0], b:cc[0], a:cc[1])
        }
        else {
            let cc = CGColorGetComponents(self.CGColor);
            return ColorComponents(r:cc[0], g:cc[1], b:cc[2], a:cc[3])
        }
    }
    
    func interpolateRGBColorTo(end: UIColor, fraction: CGFloat) -> UIColor {
        var f = max(0, fraction)
        f = min(1, fraction)
        
        let c1 = self.getComponents()
        let c2 = end.getComponents()
        
        let r = c1.r + (c2.r - c1.r) * f
        let g = c1.g + (c2.g - c1.g) * f
        let b = c1.b + (c2.b - c1.b) * f
        let a = c1.a + (c2.a - c1.a) * f
        
        return UIColor.init(red: r, green: g, blue: b, alpha: a)
    }
    
}
