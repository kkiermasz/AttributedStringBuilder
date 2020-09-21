//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

/// Adds a new line to the final `NSAttributedString`
public struct NewLine: BuilderComponent {

    // MARK: - Properties
    
    public let text = "\n"
    public let attributes = [NSAttributedString.Builder.TextAttribute]()

    // MARK: - Initialization
    
    /// Will create a `NewLine` component
    public init() {}
    
}
