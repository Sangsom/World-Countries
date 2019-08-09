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

        title = "World Countries"

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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CountryDetailSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CountryDetailSegue" {
            let vc = segue.destination as! CountryDetailsViewController
            let index = tableView.indexPathForSelectedRow?.row
            let country = countries[index!]

            vc.name = country.name
            vc.capital = country.capital
            vc.region = country.region
            vc.subRegion = country.subregion
            vc.alphaCode = country.alpha2Code
            vc.population = country.population
            vc.flagURL = country.flag
            vc.latlng = country.latlng
            vc.currency = country.currencies.first?.name
            vc.currencySymbol = country.currencies.first?.symbol
        }
    }
}

