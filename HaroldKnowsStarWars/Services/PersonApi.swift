//
//  PersonApi.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 13/12/2018.
//  Copyright © 2018 Jakub Perich. All rights reserved.
//

import Foundation

class PersonApi {
  
    
    
    func getRandomPersonUrlSession(id: Int, completion: @escaping PersonResponseCompletion) {
        guard let url = URL(string: "\(URL_PERSON)\(id)") else { return }

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
                let returnedPerson = self.parsePersonManual(jsonFromApi: json)
                DispatchQueue.main.async {
                    completion(returnedPerson)

                }
                
                
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
            
            
            
        }
        task.resume()
    }
    
    
    private func parsePersonManual(jsonFromApi:[String:Any]) -> Person {
        let name = jsonFromApi["name"] as? String ?? ""
        let birthYear = jsonFromApi["birth_year"] as? String ?? ""
        let mass = jsonFromApi["mass"] as? String ?? ""
        let height = jsonFromApi["height"] as? String ?? ""
        let hair = jsonFromApi["hair_color"] as? String ?? ""
        let homeWorldUrl = jsonFromApi["homeworld"] as? String ?? ""
        let gender = jsonFromApi["gender"] as? String ?? ""
        let vehicleUrls = jsonFromApi["vehicles"] as? [String] ?? [String]()
        let filmUrls = jsonFromApi["films"] as? [String] ?? [String]()
        let starshipUrls = jsonFromApi["starships"] as? [String] ?? [String]()
        
        return Person(name:name, birthYear:birthYear, mass:mass, height:height, hair:hair, homeWorldUrl:homeWorldUrl, gender:gender, vehicleUrls:vehicleUrls, filmUrls:filmUrls, starshipUrls:starshipUrls)
        
        
        
    }
    
    
    
    
}
