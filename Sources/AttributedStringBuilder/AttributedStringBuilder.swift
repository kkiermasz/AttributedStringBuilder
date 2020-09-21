//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

@_functionBuilder
struct AttributedStringBuilder {

    static func buildBlock() -> NSAttributedString { NSAttributedString() }

    static func buildBlock(_ components: BuilderComponent...) -> NSAttributedString {
        let builder = NSAttributedString.Builder()
        components.forEach { component in
            builder.add(component.text, with: component.attributes)
        }
        return builder.build()
    }

}
