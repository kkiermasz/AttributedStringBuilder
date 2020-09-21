//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

/// Adds a given string to the final `NSAttributedString`
public struct Text: BuilderComponent {
    
    // MARK: - Properties
    
    public let text: String
    public let attributes: [NSAttributedString.Builder.TextAttribute]
    
    // MARK: - Initialization
    
    /// Will create a `Text` component without attributes
    public init(_ text: String) {
        self.text = text
        self.attributes = []
    }
    
    /// Will create a `Text` component with given attributes
    public init(_ text: String, with attributes: NSAttributedString.Builder.TextAttribute...) {
        self.text = text
        self.attributes = attributes
    }
    
    init(_ text: String, with attributes: [NSAttributedString.Builder.TextAttribute]) {
        self.text = text
        self.attributes = attributes
    }
    
}
