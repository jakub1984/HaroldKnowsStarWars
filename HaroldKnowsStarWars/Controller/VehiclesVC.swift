//
//  VehiclesVC.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 26/12/2018.
//  Copyright © 2018 Jakub Perich. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    var passedPerson: Person!
    var api = VehiclesApi()
    var vehicles = [String]()
    var currentVehicle = 0
    
    @IBOutlet weak var vehicleNameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufacturerLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousButton: BlackBGbutton!
    @IBOutlet weak var nextButton: BlackBGbutton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = passedPerson.vehicleUrls
        guard let firstVehicle = vehicles.first else {return}
        getVehicle(url: firstVehicle)
        nextButton.isEnabled = vehicles.count > 1
        previousButton.isEnabled = false
        
        
    }
    
    func getVehicle(url: String) {
        api.getVehicleInfo(url: url) { (vehicle) in
            if let vehicleModelObject = vehicle {
                self.setupUi(vehicle: vehicleModelObject)
            }
        }
    }
    
    func setupUi (vehicle:VehicleModel) {
        vehicleNameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufacturerLbl.text = vehicle.manufacturer
        lengthLbl.text = vehicle.length
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
        
        
    }
    
    
    @IBAction func previousButtonPressed(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    
    func setButtonState() {
        previousButton.isEnabled = currentVehicle == 0 ? false : true
        nextButton.isEnabled = currentVehicle == vehicles.count - 1 ? false: true
        
//        if currentVehicle == 0 {
//            previousButton.isEnabled = false
//        } else {
//            previousButton.isEnabled = true
//        }
//
//        if currentVehicle == vehicles.count - 1 {
//            nextButton.isEnabled = false
//        } else {
//            nextButton.isEnabled = true
//        }
//
        getVehicle(url: vehicles[currentVehicle])
    }
    

}
