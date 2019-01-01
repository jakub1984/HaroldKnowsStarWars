//
//  FilmsVC.swift
//  HaroldKnowsStarWars
//
//  Created by Jakub Perich on 26/12/2018.
//  Copyright © 2018 Jakub Perich. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
   
    var passedPerson: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(passedPerson.mass)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
