//
//  CountriesController.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

class CountriesController {
    static let shared = CountriesController()

    let baseURL = URL(string: "https://restcountries.eu/rest/v2/")!

    func fetchAllCountries(completion: @escaping ([Country]?) -> Void) {
        let allCountriesURL = baseURL.appendingPathComponent("all")
        let task = URLSession.shared.dataTask(with: allCountriesURL) { (data, response, error) in
            let jsonDecode = JSONDecoder()

            if let data = data,
                let countryData = try? jsonDecode.decode([Country].self, from: data) {
                    completion(countryData)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
