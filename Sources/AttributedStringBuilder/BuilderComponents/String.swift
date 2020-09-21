//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

extension String: BuilderComponent {
    
    // MARK: - Getters
    
    public var text: String { self }
    public var attributes: [NSAttributedString.Builder.TextAttribute] { [] }
    
    // MARK: - Public
    
    public func with(attributes: NSAttributedString.Builder.TextAttribute...) -> Text {
        Text(text, with: attributes)
    }
    
}
