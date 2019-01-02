//
//  VehiclesApi.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 02/01/2019.
//  Copyright © 2019 Jakub Perich. All rights reserved.
//

import Foundation

class VehiclesApi {
    func getVehicleInfo(url: String, completion: @escaping VehiclesResponseCompletion) {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else {return}
                let returnedVehicle = self.parseVehiclesManual(jsonFromApi: json)
                DispatchQueue.main.async {
                    completion(returnedVehicle)
                    
                }
                
                
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
            
            
            
        }
        task.resume()
    }
    
    
    private func parseVehiclesManual(jsonFromApi:[String:Any]) -> VehicleModel {
        let vehicleName = jsonFromApi["name"] as? String ?? ""
        let model = jsonFromApi["model"] as? String ?? ""
        let manufacturer = jsonFromApi["manufacturer"] as? String ?? ""
        let length = jsonFromApi["length"] as? String ?? ""
        let crew = jsonFromApi["crew"] as? String ?? ""
        let passengers = jsonFromApi["passengers"] as? String ?? ""

        
        
        return VehicleModel(name:vehicleName, model:model, manufacturer:manufacturer, length:length, crew:crew, passengers:passengers)
        
    }
    
    
    
    
    
}
