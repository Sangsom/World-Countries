//
//  CountryDetailsViewController.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var capitalLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var subRegionLabel: UILabel!
    @IBOutlet var alphaCodeLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!

    // MARK: Variables
    var name: String!
    var capital: String!
    var region: String!
    var subRegion: String!
    var alphaCode: String!
    var population: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    // MARK: Helper methods

    func updateUI() {
        title = name

        capitalLabel.text = "Capital: \(capital.description)"
        regionLabel.text = "Region: \(region.description)"
        subRegionLabel.text = "Sub Region: \(subRegion.description)"
        alphaCodeLabel.text = "Code: \(alphaCode.description)"
        populationLabel.text = "Population: \(population.description)"
    }
}
