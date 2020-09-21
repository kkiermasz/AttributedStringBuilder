//
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

@testable import AttributedStringBuilder
import Nimble
import XCTest

final class AttributedStringBuilder_Tests: XCTestCase {
    
    // MARK: - Tests
    
    func test_InitWithoutComponents() {
        let sut = NSAttributedString {}
        expect(sut.string).to(equal(""))
    }
    
    // MARK: - String component
    
    func test_StringComponentWithoutAttributes() {
        let text = "Test"
        let sut = NSAttributedString { text }
        expect(sut.string).to(equal(text))
    }
    
    func test_StringComponentWithBaselineOffset() {
        let text = "Test"
        let offsetValue: CGFloat = 20
        let sut = NSAttributedString { text.with(attributes: .baselineOffset(offsetValue)) }
        expect(sut.attribute(.baselineOffset, at: 0, effectiveRange: nil)).to(be(offsetValue))
        expect(sut.string).to(equal(text))
    }
    
    func test_StringComponentWithFont() {
        let text = "Test"
        let fontSize: CGFloat = 100
        let font = Font.boldSystemFont(ofSize: fontSize)
        let sut = NSAttributedString { text.with(attributes: .font(font)) }
        expect(sut.attribute(.font, at: 0, effectiveRange: nil)).to(be(font))
        expect(sut.string).to(equal(text))
    }
    
    func test_StringComponentWithKerning() {
        let text = "Test"
        let kern: CGFloat = 100
        let sut = NSAttributedString { text.with(attributes: .kerning(kern)) }
        expect(sut.attribute(.kern, at: 0, effectiveRange: nil)).to(be(kern))
        expect(sut.string).to(equal(text))
    }
    
    func test_StringComponentWithTextColor() {
        let text = "Test"
        let textColor: Color = .red
        let sut = NSAttributedString { text.with(attributes: .textColor(textColor)) }
        expect(sut.attribute(.foregroundColor, at: 0, effectiveRange: nil)).to(be(textColor))
        expect(sut.string).to(equal(text))
    }
    
    func test_StringComponentWithUnderline() {
        let text = "Test"
        let underlineStyle: NSUnderlineStyle = .patternDashDot
        let sut = NSAttributedString { text.with(attributes: .underline(underlineStyle)) }
        expect(sut.attribute(.underlineStyle, at: 0, effectiveRange: nil)).to(be(underlineStyle.rawValue))
        expect(sut.string).to(equal(text))
    }
    
    func test_StringComponentWithMinimumLineHeight() {
        let text = "Test"
        let lineHeight: CGFloat = 100
        let sut = NSAttributedString { text.with(attributes: .minimumLineHeight(lineHeight)) }
        guard let paragraphStyle = sut.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSParagraphStyle else {
            fail("Expected paragraph style to be set")
            return
        }
        expect(paragraphStyle.minimumLineHeight).to(equal(lineHeight))
        expect(sut.string).to(equal(text))
    }
    
    func test_StringComponentWithMultipleAttributes() {
        let text = "Test"
        let kern: CGFloat = 100
        let textColor: Color = .red
        let sut = NSAttributedString { text.with(attributes: .kerning(kern), .textColor(textColor)) }
        expect(sut.attribute(.kern, at: 0, effectiveRange: nil)).to(be(kern))
        expect(sut.attribute(.foregroundColor, at: 0, effectiveRange: nil)).to(be(textColor))
        expect(sut.string).to(equal(text))
    }
    
    // MARK: - Text component
    
    func test_TextComponentWithoutAttributes() {
        let text = "Test"
        let sut = NSAttributedString { Text(text) }
        expect(sut.string).to(equal(text))
    }
    
    func test_TextComponentWithBaselineOffset() {
        let text = "Test"
        let offsetValue: CGFloat = 20
        let sut = NSAttributedString { Text(text, with: .baselineOffset(offsetValue)) }
        expect(sut.attribute(.baselineOffset, at: 0, effectiveRange: nil)).to(be(offsetValue))
        expect(sut.string).to(equal(text))
    }
    
    func test_TextComponentWithFont() {
        let text = "Test"
        let fontSize: CGFloat = 100
        let font = Font.boldSystemFont(ofSize: fontSize)
        let sut = NSAttributedString { Text(text, with: .font(font)) }
        expect(sut.attribute(.font, at: 0, effectiveRange: nil)).to(be(font))
        expect(sut.string).to(equal(text))
    }
    
    func test_TextComponentWithKerning() {
        let text = "Test"
        let kern: CGFloat = 100
        let sut = NSAttributedString { Text(text, with: .kerning(kern)) }
        expect(sut.attribute(.kern, at: 0, effectiveRange: nil)).to(be(kern))
        expect(sut.string).to(equal(text))
    }
    
    func test_TextComponentWithTextColor() {
        let text = "Test"
        let textColor: Color = .red
        let sut = NSAttributedString { Text(text, with: .textColor(textColor)) }
        expect(sut.attribute(.foregroundColor, at: 0, effectiveRange: nil)).to(be(textColor))
        expect(sut.string).to(equal(text))
    }
    
    func test_TextComponentWithUnderline() {
        let text = "Test"
        let underlineStyle: NSUnderlineStyle = .patternDashDot
        let sut = NSAttributedString { Text(text, with: .underline(underlineStyle)) }
        expect(sut.attribute(.underlineStyle, at: 0, effectiveRange: nil)).to(be(underlineStyle.rawValue))
        expect(sut.string).to(equal(text))
    }
    
    func test_TextComponentWithMinimumLineHeight() {
        let text = "Test"
        let lineHeight: CGFloat = 100
        let sut = NSAttributedString { Text(text, with: .minimumLineHeight(lineHeight)) }
        guard let paragraphStyle = sut.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSParagraphStyle else {
            fail("Expected paragraph style to be set")
            return
        }
        expect(paragraphStyle.minimumLineHeight).to(equal(lineHeight))
        expect(sut.string).to(equal(text))
    }
    
    func test_TextComponentWithMultipleAttributes() {
        let text = "Test"
        let kern: CGFloat = 100
        let textColor: Color = .red
        let sut = NSAttributedString { Text(text, with: .kerning(kern), .textColor(textColor)) }
        expect(sut.attribute(.kern, at: 0, effectiveRange: nil)).to(be(kern))
        expect(sut.attribute(.foregroundColor, at: 0, effectiveRange: nil)).to(be(textColor))
        expect(sut.string).to(equal(text))
    }
    
    // MARK: - Space component
    
    func test_SpaceComponent() {
        let sut = NSAttributedString { Space() }
        expect(sut.string).to(equal(" "))
    }
    
    // MARK: - NewLine component
    
    func test_NewLineComponent() {
        let sut = NSAttributedString { NewLine() }
        expect(sut.string).to(equal("\n"))
    }
    
    // MARK: - Multiple components
    
    func test_MultipleComponents() {
        let text1 = "Test"
        let text2 = "test"
        let sut = NSAttributedString {
            text1
            Space()
            Text(text2)
        }
        expect(sut.string).to(equal(text1 + " " + text2))
    }
    
    func test_MultipleComponentsWithAttributes() {
        let text1 = "Test"
        let text1Color = Color.red
        let text2 = "test"
        let text2Color = Color.blue
        let sut = NSAttributedString {
            text1.with(attributes: .textColor(text1Color))
            Space()
            Text(text2, with: .textColor(text2Color))
        }
        expect(sut.string).to(equal(text1 + " " + text2))
        expect(sut.attribute(.foregroundColor, at: 0, effectiveRange: nil)).to(be(text1Color))
        expect(sut.attribute(.foregroundColor, at: text1.count + " ".count, effectiveRange: nil)).to(be(text2Color))
        
    }
    
}
