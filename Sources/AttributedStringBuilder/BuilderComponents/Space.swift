//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

/// Adds a space to the final `NSAttributedString`
public struct Space: BuilderComponent {

    // MARK: - Properties
    
    public let text = " "
    public let attributes = [NSAttributedString.Builder.TextAttribute]()

    // MARK: - Initialization
    
    /// Will create a `Space` component
    public init() {}
    
}
