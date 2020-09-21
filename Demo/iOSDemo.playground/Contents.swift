//: A UIKit based Playground for presenting user interface
  
import AttributedStringBuilder
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 200)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.attributedText = NSAttributedString {
            "Huge".with(attributes: .font(.boldSystemFont(ofSize: 34)))
            NewLine()
            Text("blue", with: .textColor(.blue))
            Space()
            Text("text")
        }
        view.addSubview(label)
        self.view = view
    }
}

PlaygroundPage.current.liveView = MyViewController()
