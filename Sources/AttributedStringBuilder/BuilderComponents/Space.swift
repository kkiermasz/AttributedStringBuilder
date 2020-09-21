//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

/// Adds a space to the final `NSAttributedString`
public struct Space: BuilderComponent {

    let text = " "
    let attributes = [NSAttributedString.Builder.TextAttribute]()

}
