//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

extension NSAttributedString {
    
    // MARK: - Builder
    
    public final class Builder {
        
        // MARK: - Properties
        
        private let mutableAttributedString: NSMutableAttributedString
        
        // MARK: - Initialization
        
        /// Will create a `Builder` with an empty attributedString
        public convenience init() {
            self.init(attributedString: NSAttributedString())
        }
        
        /// Will create a new `Builder` with the given `NSAttributedString`
        ///
        /// - parameter attributedString: the baseline attributedString
        init(attributedString: NSAttributedString) {
            mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        }
        
        // MARK: - API
        
        /// Builds string from previously added substrings
        ///
        /// - Returns: builded `NSAttributedString`
        public func build() -> NSAttributedString { NSAttributedString(attributedString: mutableAttributedString) }
        
        /// Appends given text to the string that is under construction
        ///
        /// - Parameters:
        ///   - text:       Text to append to string under construction.
        ///
        /// - Returns: The `Builder` instance on which this function was called
        @discardableResult
        public func add(_ text: String) -> Self {
            add(text, with: [])
            return self
        }
        
        /// Appends given text to the string that is under construction
        ///
        /// - Parameters:
        ///   - text:       Text to append to string under construction.
        ///   - attributes: Attributes that will be set to the text
        ///
        /// - Returns: The `Builder` instance on which this function was called
        @discardableResult
        public func add(_ text: String, with attributes: TextAttribute...) -> Self {
            add(text, with: attributes)
            return self
        }
        
        @discardableResult
        func add(_ text: String, with attributes: [TextAttribute]) -> Self {
            let attributes = attributesDictionary(for: attributes)
            let string = NSAttributedString(string: text, attributes: attributes)
            mutableAttributedString.append(string)
            return self
        }
        
        // MARK: - Methods
        
        private func attributesDictionary(for attributes: [TextAttribute]) -> [NSAttributedString.Key: Any] {
            var dictionary = [NSAttributedString.Key: Any]()
            let paragraphStyle = NSMutableParagraphStyle()
            attributes.forEach { attribute in
                switch attribute {
                case let .baselineOffset(offset): dictionary[.baselineOffset] = offset
                case let .font(font): dictionary[.font] = font
                case let .kerning(value): dictionary[.kern] = value
                case let .textColor(color): dictionary[.foregroundColor] = color
                case let .underline(style): dictionary[.underlineStyle] = style.rawValue
                case let .minimumLineHeight(height): paragraphStyle.minimumLineHeight = height
                }
            }
            dictionary[.paragraphStyle] = paragraphStyle
            return dictionary
        }
        
    }
    
}
