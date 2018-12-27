//
//  ButtonAnimation.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 25/12/2018.
//  Copyright © 2018 Jakub Perich. All rights reserved.
//

import UIKit

class ButtonAnimation: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0

                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
    
    
}
