//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

public struct Text: BuilderComponent {
    
    // MARK: - Properties
    
    let text: String
    let attributes: [NSAttributedString.Builder.TextAttribute]
    
    // MARK: - Initialization
    
    public init(_ text: String) {
        self.text = text
        self.attributes = []
    }
    
    public init(_ text: String, with attributes: NSAttributedString.Builder.TextAttribute...) {
        self.text = text
        self.attributes = attributes
    }
    
    init(_ text: String, with attributes: [NSAttributedString.Builder.TextAttribute]) {
        self.text = text
        self.attributes = attributes
    }
    
}
