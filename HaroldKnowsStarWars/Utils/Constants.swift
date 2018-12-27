//
//  Constants.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 11/12/2018.
//  Copyright © 2018 Jakub Perich. All rights reserved.
//

import UIKit

let BG_COLOUR = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let URL_PERSON = URL_BASE + "people/"
typealias PersonResponseCompletion = (Person?) -> Void
