## ToggleSwitch

[![Platforms](https://img.shields.io/cocoapods/p/ToggleSwitch.svg)](https://cocoapods.org/pods/ToggleSwitch)
[![License](https://img.shields.io/cocoapods/l/ToggleSwitch.svg)](https://raw.githubusercontent.com/Decimal/ToggleSwitch/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/ToggleSwitch.svg)](https://cocoapods.org/pods/ToggleSwitch)

[![Travis](https://img.shields.io/travis/Decimal/ToggleSwitch/master.svg)](https://travis-ci.org/Decimal/ToggleSwitch/branches)
[![JetpackSwift](https://img.shields.io/badge/JetpackSwift-framework-red.svg)](http://github.com/JetpackSwift/Framework)

A custom UISwitch

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 9.0+
- Xcode 8.0+

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

#### Git Submodules

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add ToggleSwitch as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/Decimal/ToggleSwitch.git
$ git submodule update --init --recursive
```

- Open the new `ToggleSwitch` folder, and drag the `ToggleSwitch.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `ToggleSwitch.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `ToggleSwitch.xcodeproj` folders each with two different versions of the `ToggleSwitch.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `ToggleSwitch.framework`.

- And that's it!

> The `ToggleSwitch.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

#### Embeded Binaries

- Download the latest release from https://github.com/Decimal/ToggleSwitch/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `ToggleSwitch.framework`.
- And that's it!

## Usage

## License

ToggleSwitch is released under the MIT license. See [LICENSE](https://github.com/Decimal/ToggleSwitch/blob/master/LICENSE) for details.
