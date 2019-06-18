## ToggleSwitch

[![Platforms](https://img.shields.io/cocoapods/p/ToggleSwitch.svg)](https://cocoapods.org/pods/ToggleSwitch)
[![License](https://img.shields.io/cocoapods/l/ToggleSwitch.svg)](https://raw.githubusercontent.com/Decimal/ToggleSwitch/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/ToggleSwitch.svg)](https://cocoapods.org/pods/ToggleSwitch)

[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=597b5efb29742d00016dff41&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/597b5efb29742d00016dff41/build/latest?branch=master)
[![JetpackSwift](https://img.shields.io/badge/JetpackSwift-framework-red.svg)](http://github.com/JetpackSwift/Framework)

A simple and custom UISwitch made out of images.



- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 11.0+
- Xcode 9.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build ToggleSwitch 1.0+.

To integrate ToggleSwitch into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'ToggleSwitch', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate ToggleSwitch into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ToggleSwitch/ToggleSwitch" ~> 1.0
```
### Swift Package Manager

To use ToggleSwitch as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
import PackageDescription

let package = Package(
    name: "HelloToggleSwitch",
    dependencies: [
        .Package(url: "https://github.com/dimitris-c/ToggleSwitch.git", "1.0")
    ]
)
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate ToggleSwitch into your project manually.

#### Embeded Binaries

- Download the latest release from https://github.com/dimitris-c/ToggleSwitch/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `ToggleSwitch.framework`.
- And that's it!

## Usage

Pretty standard integration as it's like adding a UISwitch.

```swift
let images = ToggleSwitchImages(baseOnImage: UIImage(named: "base_on"), 
                                baseOffImage: UIImage(named: "base_off"),
                                thumbOnImage: UIImage(named: "thumb_on"),
                                thumbOffImage: UIImage(named: "thumb_off"))

// ToggleSwitch will use the baseOnImage to construct the size of the control
let onOffSwitch = ToggleSwitch(with: images)
onOffSwitch.frame.origin = CGPoint(x: 100, y: 100)
self.addSubview(onOffSwitch)                  

```

The control exposes two ways of retrieving when the value/state has changed.
#### Using Block
```swift

onOffSwitch.stateChange = { isOn in 
    if isOn {
        // do something
    }
}

```

#### Using Target-Action
```swift

onOffSwitch.addTarget(self, action: #selector(toggleValueChanged), for: .valueChanged)

@objc func toggleValueChanged(control: ToggleSwitch) {
    if onOffSwitch.isOn { 
        // do something
    }
}

```

Similar to UISwitch, ToggleSwitch exposes `isOn` and `setOn(on:animated:)` method
```swift

onOffSwitch.isOn = true

onOffSwitch.setOn(on: false, animated: true)

```

## License

ToggleSwitch is released under the MIT license. See [LICENSE](https://github.com/Decimal/ToggleSwitch/blob/master/LICENSE) for details.
