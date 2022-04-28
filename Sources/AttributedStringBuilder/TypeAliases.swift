//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

#if canImport(UIKit)

import UIKit
typealias Color = UIColor
typealias Font = UIFont

#elseif canImport(AppKit)

import AppKit
typealias Color = NSColor
typealias Font = NSFont

#else

#error("wtf")

#endif
