//
//  ViewController.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 11/12/2018.
//  Copyright © 2018 Jakub Perich. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehicleBtn: UIButton!
    
    
    
    var personApi = PersonApi()
    var personToPass : Person!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeworldBtn.isEnabled = false
        vehicleBtn.isEnabled = false
    }
    
    @IBAction func randomPressed(_ sender: Any) {
        let randomId = Int.random(in: 1...10)
        
        personApi.getRandomPersonUrlSession(id: randomId) { (returnedPerson) in
            if let returnedPerson = returnedPerson {
                self.setupView(returnedPerson: returnedPerson)
                self.personToPass = returnedPerson
                
            }
        }
    }
    
    func setupView(returnedPerson: Person) {
        nameLbl.text = returnedPerson.name
        heightLbl.text = returnedPerson.height
        massLbl.text = returnedPerson.mass
        hairLbl.text  = returnedPerson.hair
        birthYearLbl.text = returnedPerson.birthYear
        genderLbl.text = returnedPerson.gender
        
        homeworldBtn.isEnabled = !returnedPerson.homeWorldUrl.isEmpty
        vehicleBtn.isEnabled = !returnedPerson.vehicleUrls.isEmpty
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.passedPerson = personToPass
        }
        
        
    }
//    todo: try approach with "IF ELSE" statements

//            SEGUE WITH SWITCH
   
//        switch segue.identifier {
//        case Segue.homeworld.rawValue:
//            if let destination = segue.destination as? HomeworldVC {
//                destination.passedPerson = personToPass
//            }
//        case Segue.vehicles.rawValue:
//            if let destination = segue.destination as? VehiclesVC {
//                destination.passedPerson = personToPass
//            }
//
//        default:
//            break
//        }
//    }
//
//
//    enum Segue: String {
//        case homeworld = "toHomeworld"
//        case vehicles = "toVehicles"
//
//    }
    
    
    
   

}

