//
//  CountryDetailsViewController.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit
import Macaw

class CountryDetailsViewController: UIViewController {

    // MARK: Outlets
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
    var flagURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadFlag()
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

    func loadFlag() {
        let text = try! String(contentsOf: flagURL, encoding: String.Encoding.utf8)
        let node = try! SVGParser.parse(text: text)
        let flagView = MacawView(node: node, frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200))
        flagView.contentMode = .scaleAspectFit
        self.view.addSubview(flagView)
    }
}
