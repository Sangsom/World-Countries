//
//  ViewController.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        CountriesController.shared.fetchAllCountries { (countriesData) in
            if let countriesData = countriesData {
                DispatchQueue.main.async {
                    self.countries = countriesData
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryIdentifier", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        return cell
    }
}

