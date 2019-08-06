//
//  Country.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct Country: Codable {
    var name: String
    var capital: String
    var flag: URL
}

struct Countries: Codable {
    var countries: [Country]
}
