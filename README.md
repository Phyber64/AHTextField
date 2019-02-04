# AHTextField

[![CI Status](https://img.shields.io/travis/Phyber64/AHTextField.svg?style=flat)](https://travis-ci.org/Phyber64/AHTextField)
[![Version](https://img.shields.io/cocoapods/v/AHTextField.svg?style=flat)](https://cocoapods.org/pods/AHTextField)
[![License](https://img.shields.io/cocoapods/l/AHTextField.svg?style=flat)](https://cocoapods.org/pods/AHTextField)
[![Platform](https://img.shields.io/cocoapods/p/AHTextField.svg?style=flat)](https://cocoapods.org/pods/AHTextField)

## Screenshots
![img](https://imgur.com/Rq3cXaG.png)
![img](https://imgur.com/Oxy32J7.png)
![img](https://imgur.com/uu17SR8.png)

## Example

To run the *example project*, clone the repo, and run `pod install` from the Example directory first.


## Requirements

iOS 9.0+

## Usage

### Exampple of AHTextField
```swift
lazy var textField: AHTextField = {
    let textField = AHTextField(textPadding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15))
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.setLeftViewImage(image: UIImage(named: "lock"), size: CGSize(width: 25, height: 25), tintColor: .gray)
    textField.setRightViewImage(image: UIImage(named: "cancel"), size: CGSize(width: 30, height: 30), tintColor: appleRed)
    textField.leftViewPadding.left = 8
    textField.setBorders(width: 2, color: .blue)
    textField.placeholder = "Password"
    return textField
}()
```

### Initialization with default text padding
```swift
let textField = AHTextField(textPadding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
```

### Adding images
```swift
textField.setLeftViewImage(image: image1, size: CGSize(width: 25, height: 25), tintColor: .gray)
textField.setRightViewImage(image: image2, size: CGSize(width: 30, height: 30), tintColor: .red, backgroundColor: .blue)
```

### Setting borders
```swift
textField.setBorders(for: [.bottom], width: 3, gradient: gradientLayer)
```
Note: gradientLayer is copied => you can use one gradintLayer as a parameter for multiple textFields 

or

```swift
textField.setBorders(width: 2, color: appleBlue)
```

### Padding
You can change the padding if default values don't fit
```swift
textField.leftViewPadding.left = 8
textField.clearButtonPadding.right = 15
textField.rightViewPadding.right = 10
```

## Installation

AHTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AHTextField'
```

## Author

Aleš Hanžlík, hanzlikale@gmail.com

## License

AHTextField is available under the MIT license. See the LICENSE file for more info.
