//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

extension String: BuilderComponent {
    
    // MARK: - Getters
    
    var text: String { self }
    var attributes: [NSAttributedString.Builder.TextAttribute] { [] }
    
    // MARK: - Public
    
    public func with(attributes: NSAttributedString.Builder.TextAttribute...) -> Text {
        Text(text, with: attributes)
    }
    
}
