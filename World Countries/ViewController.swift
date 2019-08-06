//
//  ViewController.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var countries: [Country]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        CountriesController.shared.fetchAllCountries { (countriesData) in
            if let countriesData = countriesData {
                DispatchQueue.main.async {
                    self.countries = countriesData
                    print(countriesData)
                }
            }
        }
    }
}

