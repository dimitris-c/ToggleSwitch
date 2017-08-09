//
//  ToggleSwitchSpec.swift
//  ToggleSwitch
//
//  Created by Dimitris C. on 04/10/16.
//  Copyright © 2017 Decimal. All rights reserved.
//

import Quick
import Nimble
@testable import ToggleSwitch

class ToggleSwitchSpec: QuickSpec {

    override func spec() {

        describe("ToggleSwitchSpec") {

            context("ToggleSwitchImages") {
                it("can be initialized with images") {
                    let configImages = ToggleSwitchImages(baseOnImage: UIImage(),
                                                          baseOffImage: UIImage(),
                                                          thumbOnImage: UIImage(),
                                                          thumbOffImage: UIImage())

                    expect(configImages.baseOnImage).toNot(beNil())
                    expect(configImages.baseOffImage).toNot(beNil())
                    expect(configImages.thumbOnImage).toNot(beNil())
                    expect(configImages.thumbOffImage).toNot(beNil())
                }
            }

            context("ToggleSwitch", {
                var configImages: ToggleSwitchImages!
                var onOffSwitch: ToggleSwitch!
                beforeEach {
                    configImages = ToggleSwitchImages(baseOnImage: UIImage(),
                                                      baseOffImage: UIImage(),
                                                      thumbOnImage: UIImage(),
                                                      thumbOffImage: UIImage())

                    onOffSwitch = ToggleSwitch(with: configImages)
                    onOffSwitch.sizeToFit()
                }

                it("can be initiliazed with configuration") {

                    expect(onOffSwitch.configurationImages).toNot(beNil())
                    expect(onOffSwitch.frame).to(equal(CGRect.zero))

                    expect(onOffSwitch.baseImage(for: .on)).to(equal(configImages.baseOnImage))
                    expect(onOffSwitch.baseImage(for: .off)).to(equal(configImages.baseOffImage))

                    expect(onOffSwitch.thumbImage(for: .on)).to(equal(configImages.thumbOnImage))
                    expect(onOffSwitch.thumbImage(for: .off)).to(equal(configImages.thumbOffImage))
                }

                it("can change the base images on demand") {
                    let bundle: Bundle = Bundle(for: ToggleSwitchSpec.self)

                    expect(onOffSwitch.baseImage(for: .on)).to(equal(configImages.baseOnImage))
                    expect(onOffSwitch.baseImage(for: .off)).to(equal(configImages.baseOffImage))
                    expect(onOffSwitch.frame).to(equal(CGRect.zero))

                    let baseOnImage = UIImage(named: "toggle_base_on", in: bundle, compatibleWith: nil)
                    onOffSwitch.setBase(image: baseOnImage, for: .on)
                    expect(onOffSwitch.baseImage(for: .on)).to(equal(baseOnImage))

                    let baseOffImage = UIImage(named: "toggle_base_off", in: bundle, compatibleWith: nil)
                    onOffSwitch.setBase(image: baseOffImage , for: .off)
                    expect(onOffSwitch.baseImage(for: .off)).to(equal(baseOffImage))
                }

                it("can change the thumb images on demand") {
                    let bundle: Bundle = Bundle(for: ToggleSwitchSpec.self)
                    
                    expect(onOffSwitch.thumbImage(for: .on)).to(equal(configImages.thumbOnImage))
                    expect(onOffSwitch.thumbImage(for: .off)).to(equal(configImages.thumbOffImage))

                    let baseOnImage = UIImage(named: "toggle_button_on", in: bundle, compatibleWith: nil)
                    onOffSwitch.setThumb(image: baseOnImage, for: .on)
                    expect(onOffSwitch.thumbImage(for: .on)).to(equal(baseOnImage))

                    let baseOffImage = UIImage(named: "toggle_button_off", in: bundle, compatibleWith: nil)
                    onOffSwitch.setThumb(image: baseOffImage , for: .off)
                    expect(onOffSwitch.thumbImage(for: .off)).to(equal(baseOffImage))
                }

                it("can change its change state") {

                    onOffSwitch.isOn = false
                    expect(onOffSwitch.isOn).to(beFalse())

                    onOffSwitch.isOn = true
                    expect(onOffSwitch.isOn).to(beTrue())

                    onOffSwitch.setOn(on: false, animated: false)
                    expect(onOffSwitch.isOn).to(beFalse())

                    onOffSwitch.setOn(on: true, animated: false)
                    expect(onOffSwitch.isOn).to(beTrue())
                }

            })
        }

    }

}
