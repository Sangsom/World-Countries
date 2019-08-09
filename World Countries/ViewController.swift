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
    var filteredCountries = [Country]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search Country"
        navigationItem.searchController = searchController
        definesPresentationContext = true

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
        if isFiltering() {
            return filteredCountries.count
        }

        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryIdentifier", for: indexPath)
        let country: Country
        if isFiltering() {
            country = filteredCountries[indexPath.row]
        } else {
            country = countries[indexPath.row]
        }
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
            let country: Country
            if isFiltering() {
                country = filteredCountries[index!]
            } else {
                country = countries[index!]
            }

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

    // MARK: Helper methods
    func searchBarIsEmptry() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCountries = countries.filter({ (country: Country) -> Bool in
            return country.name.lowercased().contains(searchText.lowercased())
        })

        tableView.reloadData()
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmptry()
    }
}

extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
