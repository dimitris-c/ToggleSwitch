//
//  ToggleSwitch.swift
//  ToggleSwitch
//
//  Created by Dimitris C. on 27/07/2017.
//  Copyright © 2017 Decimal. All rights reserved.
//

import UIKit

public typealias ToggleSwitchBlock = ((ToggleSwitchState) -> Void)

public enum ToggleSwitchState {
    case on
    case off
}

public struct ToggleSwitchImages {
    let baseOnImage: UIImage
    let baseOffImage: UIImage
    let thumbOnImage: UIImage
    let thumbOffImage: UIImage

    public init(baseOnImage: UIImage, baseOffImage: UIImage, thumbOnImage: UIImage, thumbOffImage: UIImage) {
        self.baseOnImage = baseOnImage
        self.baseOffImage = baseOffImage
        self.thumbOnImage = thumbOnImage
        self.thumbOffImage = thumbOffImage
    }
}

/** 
 A custom UISwitch made out of images.
 */
open class ToggleSwitch: UIControl {

    private var panBase: UIView!
    private var base: UIImageView!
    private var thumb: UIImageView!

    private var baseOnImage: UIImage?
    private var baseOffImage: UIImage?

    private var thumbOnImage: UIImage?
    private var thumbOffImage: UIImage?

    private var leftEdge: CGFloat = 0
    private var rightEdge: CGFloat = 0

    private(set) var switchState: ToggleSwitchState = .off

    public var configurationImages: ToggleSwitchImages?

    public var isOn: Bool = false {
        didSet {
            self.setState(on: isOn, animated: false)
        }
    }

    public var stateChanged: ToggleSwitchBlock?

    public init(with images: ToggleSwitchImages) {
        super.init(frame: .zero)
        self.configurationImages = images
        self.setupCommon()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupCommon()
    }

    private func setupCommon() {
        self.base = UIImageView()
        self.base.isUserInteractionEnabled = true
        self.thumb = UIImageView()
        self.thumb.isUserInteractionEnabled = true

        self.setBase(image: configurationImages?.baseOnImage, for: .on)
        self.setBase(image: configurationImages?.baseOffImage, for: .off)

        self.setThumb(image: configurationImages?.thumbOnImage, for: .on)
        self.setThumb(image: configurationImages?.thumbOffImage, for: .off)

        self.base.image = self.baseOffImage
        self.thumb.image = self.thumbOffImage

        self.base.sizeToFit()
        self.thumb.sizeToFit()

        self.leftEdge = self.thumb.frame.width * 0.5
        self.rightEdge = self.base.frame.maxX - self.thumb.frame.width * 0.5

        self.thumb.center = CGPoint(x: self.leftEdge, y: self.base.frame.height * 0.5)

        let panBaseRect = CGRect(x: self.base.frame.minX + self.thumb.frame.size.width * 0.5,
                                 y: self.base.frame.minY,
                                 width: self.base.frame.width - self.thumb.frame.size.width,
                                 height: self.base.frame.height)
        self.panBase = UIView(frame: panBaseRect)
        self.addSubview(self.panBase)

        self.addSubview(self.base)
        self.addSubview(self.thumb)

        self.addGestures()
    }

    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        self.base.sizeToFit()
        if let offImageSize = self.baseOffImage {
            return CGSize(width: offImageSize.size.width, height: offImageSize.size.height)
        }
        return CGSize(width: self.base.bounds.width, height: self.base.bounds.height)
    }

    override open func layoutSubviews() {
        super.layoutSubviews()

        self.base.sizeToFit()
        self.base.frame = self.bounds
    }

    /**
     Sets the background image to use for the specified toggle switch state.
     
     - parameter image: The background image to use for the specified state.
     - parameter state: The state that uses the specified image. The values are described in `ToggleSwitchState`.
    */
    public func setBase(image: UIImage?, `for` state: ToggleSwitchState) {
        switch state {
        case .on:
            self.baseOnImage = image
            break
        case .off:
            self.baseOffImage = image
            break
        }
        if switchState == .on {
            self.base.image = image
        } else if switchState == .off {
            self.base.image = image
        }
        self.base.sizeToFit()
        self.sizeToFit()
    }

    /**
     Returns the background image used for a toggle switch state.

     - parameter state: The background image used for the specified state.
    */
    public func baseImage(`for` state: ToggleSwitchState) -> UIImage? {
        return state == .on ? self.baseOnImage : self.baseOffImage
    }

    /**
     Sets the thumb image to use for the specified toggle switch state.

     - parameter image: The thumb image to use for the specified state.
     - parameter state: The state that uses the specified image. The values are described in `ToggleSwitchState`.
     */
    public func setThumb(image: UIImage?, `for` state: ToggleSwitchState) {
        switch state {
        case .on:
            self.thumbOnImage = image
            break
        case .off:
            self.thumbOffImage = image
            break
        }
        self.thumb.sizeToFit()
    }

    /**
     Returns the thumb image used for a toggle switch state.

     - parameter state: The thumb image used for the specified state.
     */
    public func thumbImage(`for` state: ToggleSwitchState) -> UIImage? {
        return state == .on ? self.thumbOnImage : self.thumbOffImage
    }

    /**
     Set the state of the switch to On or Off, optionally animating the transition.

     - parameter state: true if the switch should be turned to the On position; false if it should be turned to the Off position.
     - parameter animated: `true` to animate the “flipping” of the switch; otherwise `false`.

     */
    public func setOn(on: Bool, animated: Bool) {
        isOn = on
        setState(on: on, animated: animated)
    }

    // MARK: Private

    private func setState(on: Bool, animated: Bool) {
        if on {
            switchState = .on
            self.onState(animated: animated, isTriggeredByUserInteraction: false)
        } else {
            switchState = .off
            self.offState(animated: animated, isTriggeredByUserInteraction: false)
        }
    }

    private func addGestures() {
        let panRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(panHandle))
        let baseTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandle))

        self.thumb.addGestureRecognizer(panRecongnizer)
        self.base.addGestureRecognizer(baseTapRecognizer)
    }

    @objc private func panHandle(gesture: UIPanGestureRecognizer) {
        let currentPoint = gesture.location(in: self.panBase)
        let position = currentPoint.x
        let positionValue = position / self.panBase.frame.width

        if gesture.state == .began || gesture.state == .changed {
            if positionValue < 1.0 && positionValue > 0.0 {
                self.setThumb(position: positionValue, ended: false)
            }
        }

        if gesture.state == .ended {
            if positionValue < 1.0 && positionValue > 0.0 {
                self.setThumb(position: positionValue, ended: true)
            } else if positionValue >= 1.0 {
                self.setThumb(position: 1.0, ended: true)
            } else if positionValue < 0.0 {
                self.setThumb(position: 0.0, ended: true)
            }
        }
    }

    @objc private func tapHandle(gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            if self.thumb.center.x == self.rightEdge {
                self.switchState = .off
                offState(animated: true, isTriggeredByUserInteraction: true)
            }
            else if self.thumb.center.x == self.leftEdge {
                self.switchState = .on
                onState(animated: true, isTriggeredByUserInteraction: true)
            }
        }
    }

    private func setThumb(position: CGFloat, ended: Bool) {
        if !ended {
            if position == 0.0 {
                self.thumb.center = CGPoint(x: self.leftEdge, y: self.thumb.center.y)
            } else if position == 1.0 {
                self.thumb.center = CGPoint(x: self.rightEdge, y: self.thumb.center.y)
            } else {
                let x = self.panBase.frame.minX + (position * self.panBase.frame.width)
                self.thumb.center = CGPoint(x: x, y: self.thumb.center.y)
            }
        } else {
            if position == 0.0 {
                self.switchState = .off
                offState(animated: false, isTriggeredByUserInteraction: true)
            }
            else if position == 1.0 {
                self.switchState = .on
                onState(animated: false, isTriggeredByUserInteraction: true)
            }
            else if position > 0.0 && position < 0.5 {
                self.switchState = .off
                offState(animated: true, isTriggeredByUserInteraction: true)
            }
            else if position >= 0.5 && position < 1.0 {
                self.switchState = .on
                onState(animated: true, isTriggeredByUserInteraction: true)
            }
        }
    }

    private func onState(animated: Bool, isTriggeredByUserInteraction: Bool) {
        UIView.animate(withDuration: animated ? 0.1 : 0, animations: {
            self.thumb.center = CGPoint(x: self.rightEdge, y: self.thumb.center.y)
        }, completion: { completed in
            self.base.image = self.baseOnImage
            self.thumb.image = self.thumbOnImage
            if isTriggeredByUserInteraction {
                self.sendActions(for: .valueChanged)
                self.stateChanged?(self.switchState)
            }
        })
    }

    private func offState(animated: Bool, isTriggeredByUserInteraction: Bool) {
        UIView.animate(withDuration: animated ? 0.1 : 0, animations: {
            self.thumb.center = CGPoint(x: self.leftEdge, y: self.thumb.center.y)
        }, completion: { completed in
            self.base.image = self.baseOffImage
            self.thumb.image = self.thumbOffImage
            if isTriggeredByUserInteraction {
                self.sendActions(for: .valueChanged)
                self.stateChanged?(self.switchState)
            }
        })
    }

}
