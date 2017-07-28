//
//  ViewController.swift
//  ToggleSwitchDemo
//
//  Created by Dimitris C. on 27/07/2017.
//  Copyright © 2017 Decimal. All rights reserved.
//

import UIKit
import ToggleSwitch

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let images = ToggleSwitchImages(baseOnImage: #imageLiteral(resourceName: "toggle_base_on"),
                                        baseOffImage: #imageLiteral(resourceName: "toggle_base_off"),
                                        thumbOnImage: #imageLiteral(resourceName: "toggle_button_on"),
                                        thumbOffImage: #imageLiteral(resourceName: "toggle_button_off"))

        let toggle = ToggleSwitch(with: images)
        toggle.frame.origin.x = 100
        toggle.frame.origin.y = 100

        self.view.addSubview(toggle)

        // using block based
        toggle.stateChanged = { state in
            print("state changed: \(state)")
        }

        // using addTarget
        toggle.addTarget(self, action: #selector(toggleValueChanged), for: .valueChanged)

        toggle.setOn(on: true, animated: true)

    }

    @objc func toggleValueChanged(toggle: ToggleSwitch) {
        print("valueChanged: \(toggle.isOn)")
    }

}

