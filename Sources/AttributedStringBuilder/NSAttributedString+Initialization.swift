//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import Foundation

extension NSAttributedString {

    public convenience init(@AttributedStringBuilder builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }

}
