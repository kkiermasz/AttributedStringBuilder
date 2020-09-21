//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

extension NSAttributedString.Builder {
    
    /// Text attributes that are set to the string
    public enum TextAttribute {
        
        /// Vertical offset for text position.
        case baselineOffset(CGFloat)
        
        /// Text font
        #if canImport(UIKit)
        case font(UIFont)
        #else
        case font(NSFont)
        #endif
        
        /// Specifies the number of points by which to adjust kern-pair characters
        case kerning(CGFloat)
        
        /// Text color
        #if canImport(UIKit)
        case textColor(UIColor)
        #else
        case textColor(NSColor)
        #endif
        
        ///  Indicates whether the text is underlined and corresponds to one of the constants described in `NSUnderlineStyle`
        case underline(NSUnderlineStyle)
        
        /// Contains the minimum height in points that any line in the receiver will occupy, regardless of the font size or size of any attached graphic. This value must be nonnegative.
        case minimumLineHeight(CGFloat)
        
    }
    
}
