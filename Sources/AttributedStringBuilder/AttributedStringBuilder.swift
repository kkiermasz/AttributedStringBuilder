//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

@_functionBuilder
public struct AttributedStringBuilder {

    public static func buildBlock() -> NSAttributedString { NSAttributedString() }

    public static func buildBlock(_ components: BuilderComponent...) -> NSAttributedString {
        let builder = NSAttributedString.Builder()
        components.forEach { component in
            builder.add(component.text, with: component.attributes)
        }
        return builder.build()
    }

}
