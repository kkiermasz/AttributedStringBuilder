//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

protocol BuilderComponent {

    var text: String { get }
    var attributes: [NSAttributedString.Builder.TextAttribute] { get }

}
