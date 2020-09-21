//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

/// The interface that the components to be added to the string must fulfill in closure initialization
public protocol BuilderComponent {

    var text: String { get }
    var attributes: [NSAttributedString.Builder.TextAttribute] { get }

}
