//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

extension NSAttributedString {

    convenience init(@AttributedStringBuilder builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }

}
