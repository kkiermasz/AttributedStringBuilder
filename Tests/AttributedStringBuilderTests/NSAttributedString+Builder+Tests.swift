//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

@testable import AttributedStringBuilder
import Nimble
import XCTest

final class NSAttributedString_Builder_Tests: XCTestCase {
    
    // MARK: - Tests
    
    func test_InitWithoutParameters() {
        let sut = NSAttributedString.Builder()
        expect(sut.build().string).to(equal(""))
    }
    
    func test_InitWithGivenBaselineString() {
        let sut = NSAttributedString.Builder(attributedString: .testAttributedString)
        
        expect(sut.build()).to(equal(NSAttributedString.testAttributedString))
    }
    
    func test_Build() {
        let text = "Test"
        let initialObject = NSAttributedString(string: text)
        let sut = NSAttributedString.Builder(attributedString: initialObject)
        
        expect(sut.build()).to(beAKindOf(NSAttributedString.self))
    }
    
    func test_AddWithBaselineOffset() {
        let sut = NSAttributedString.Builder()
        let text = "Test"
        let offsetValue: CGFloat = 20
        
        sut.add(text, with: .baselineOffset(offsetValue))
        
        expect(sut.build().attribute(.baselineOffset, at: 0, effectiveRange: nil)).to(be(offsetValue))
    }
    
    func test_AddWithFont() {
        let sut = NSAttributedString.Builder()
        let text = "Test"
        let fontSize: CGFloat = 100
        let font = Font.boldSystemFont(ofSize: fontSize)
        
        sut.add(text, with: .font(font))
        
        expect(sut.build().attribute(.font, at: 0, effectiveRange: nil)).to(be(font))
    }
    
    func test_AddWithKerning() {
        let sut = NSAttributedString.Builder()
        let text = "Test"
        let kern: CGFloat = 100
        
        sut.add(text, with: .kerning(kern))
        
        expect(sut.build().attribute(.kern, at: 0, effectiveRange: nil)).to(be(kern))
    }
    
    func test_AddWithTextColor() {
        let sut = NSAttributedString.Builder()
        let text = "Test"
        let textColor: Color = .red
        
        sut.add(text, with: .textColor(textColor))
        
        expect(sut.build().attribute(.foregroundColor, at: 0, effectiveRange: nil)).to(be(textColor))
    }
    
    func test_AddWithUnderline() {
        let sut = NSAttributedString.Builder()
        let text = "Test"
        let underlineStyle: NSUnderlineStyle = .patternDashDot
        
        sut.add(text, with: .underline(underlineStyle))
        
        expect(sut.build().attribute(.underlineStyle, at: 0, effectiveRange: nil)).to(be(underlineStyle.rawValue))
    }
    
    func test_AddWithMinimumLineHeight() {
        let sut = NSAttributedString.Builder()
        let text = "Test"
        let lineHeight: CGFloat = 100
        
        sut.add(text, with: .minimumLineHeight(lineHeight))
        
        guard let paragraphStyle = sut.build().attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSParagraphStyle else {
            fail("Expected paragraph style to be set")
            return
        }
        
        expect(paragraphStyle.minimumLineHeight).to(equal(lineHeight))
    }
    
    func test_AddWithMultipleAttributes() {
        let sut = NSAttributedString.Builder()
        let text = "Test"
        let kern: CGFloat = 100
        let textColor: Color = .red
        
        sut.add(text, with: .kerning(kern), .textColor(textColor))
        
        expect(sut.build().attribute(.kern, at: 0, effectiveRange: nil)).to(be(kern))
        expect(sut.build().attribute(.foregroundColor, at: 0, effectiveRange: nil)).to(be(textColor))
    }
    
    func test_MutltipleSubstringAddition() {
        let sut = NSAttributedString.Builder()
        let text = "Test"
        
        sut.add(text).add(text)
        
        expect(sut.build().string).to(equal(text + text))
    }
    
}

extension NSAttributedString {
    
    fileprivate static let testAttributedString: NSAttributedString = {
        let attributedString = NSMutableAttributedString(string: "Test text")
        let attributes: [NSAttributedString.Key: Any] = [
            .backgroundColor: Color.red
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: attributedString.string.count))
        return attributedString
    }()
    
}
