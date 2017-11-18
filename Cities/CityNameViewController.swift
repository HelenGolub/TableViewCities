//
//  CityNameViewController.swift
//  Cities
//
//  Created by Елена Ярцева on 16.11.17.
//  Copyright © 2017 com.test. All rights reserved.
//

import UIKit

class CityNameViewController: UIViewController {
    
    var nameOfTheCity: String?

    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityNameLabel.text = nameOfTheCity
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
