//
//  HomeworldVC.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 26/12/2018.
//  Copyright © 2018 Jakub Perich. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
    var passedPerson : Person!
    var api = HomeworldApi()
    
    @IBOutlet weak var homeworldNameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeworldInfo(url: passedPerson.homeWorldUrl) { (homeworld) in
            if let homeworldLoaded = homeworld {
                self.setupUi(homeworld: homeworldLoaded)
            }
        }
        
    }
    
    
    func setupUi(homeworld: Homeworld) {
        homeworldNameLbl.text = homeworld.homeworldName
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
    
}
