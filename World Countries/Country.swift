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
    var alpha2Code: String
    var capital: String
    var region: String
    var subregion: String
    var population: Int
    var flag: URL
    var latlng: [Double]
}
