//
//  HomeworldApi.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 01/01/2019.
//  Copyright © 2019 Jakub Perich. All rights reserved.
//

import Foundation

class HomeworldApi {
    func getHomeworldInfo(url: String, completion: @escaping HomeworldResponseCompletion) {
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
                let returnedHomeworld = self.parseHomeworldManual(jsonFromApi: json)
                DispatchQueue.main.async {
                    completion(returnedHomeworld)
                    
                }
                
                
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
            
            
            
        }
        task.resume()
    }
    
    
    private func parseHomeworldManual(jsonFromApi:[String:Any]) -> Homeworld {
        let homeworldName = jsonFromApi["name"] as? String ?? ""
        let terrain = jsonFromApi["terrain"] as? String ?? ""
        let climate = jsonFromApi["climate"] as? String ?? ""
        let population = jsonFromApi["population"] as? String ?? ""

        return Homeworld(homeworldName: homeworldName, terrain: terrain, climate: climate, population: population)
        
    }
        
        
        
    
    
}
