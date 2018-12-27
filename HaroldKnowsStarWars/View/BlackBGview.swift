//
//  BlackBGview.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 11/12/2018.
//  Copyright © 2018 Jakub Perich. All rights reserved.
//

import UIKit

class BlackBGview: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = BG_COLOUR
        layer.cornerRadius = 10
    }
}

class BlackBGbutton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BG_COLOUR
        layer.cornerRadius = 10
            }
    
}
