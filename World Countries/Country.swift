//
//  Country.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let alpha2Code: String
    let capital: String
    let region: String
    let subregion: String
    let population: Int
    let flag: URL
    let latlng: [Double]
    let currencies: [Currency]
}

struct Currency: Codable {
    let code: String?
    let name: String?
    let symbol: String?
}
