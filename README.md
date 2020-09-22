# AttributedStringBuilder

AttributedStringBuilder is a simple builder that makes composing NSAttributedString pleasant.

## Features

It provides two ways of composing attributed strings. 

### Composing in closure

```swift
NSAttributedString {
    "Doesn't that".with(attributes: .font(.boldSystemFont(ofSize: 34)))
    Space()
    Text("look", with: .textColor(.blue))
    "wonderful?"
    NewLine()
}
```

### Composing using chaining

```swift
NSAttributedString.Builder()
    .add("Doesn't", with: .font(.boldSystemFont(ofSize: 34)))
    .add(.space)
    .add("that", with: .textColor(.blue))
    .add("either?")
    .add(.newLine)
    .build()
```

## Requirements

- Swift 5.3+
- Xcode 12.0+
- iOS 11.0+ / macOS 10.11+ / tvOS 11.0+

## Installation

### Using [Swift Package Manager](https://swift.org/package-manager/)

Select File > Swift Packages > Add Package Dependency and enter the repository URL. 

    https://github.com/kkiermasz/AttributedStringBuilder
        
## Usage

Import the AttributedStringBuilder

```swift
import AttributedStringBuilder
```

And compose your awesome attributed string in one of previously introduced ways. 

## Demo

The playground demo can be found in the workspace associated with the project.
remember that you have to build the library first.

## License

AttributedStringBuilder is shared under the MIT license. See the [LICENSE](./LICENSE) for more info.
