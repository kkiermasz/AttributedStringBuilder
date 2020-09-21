//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

/// Adds a new line to the final `NSAttributedString`
public struct NewLine: BuilderComponent {

    let text = "\n"
    let attributes = [NSAttributedString.Builder.TextAttribute]()

}
