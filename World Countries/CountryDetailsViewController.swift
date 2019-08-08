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
    var flagView: MacawView!

    override func viewDidLayoutSubviews() {
        flagView.frame.origin = CGPoint(x: 0, y: self.view.safeAreaInsets.top + 10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    // MARK: Helper methods

    func updateUI() {
        loadFlag()
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

        flagView = MacawView(
            node: node,
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.width / 2.0))
        flagView.contentMode = .scaleAspectFill
        self.view.addSubview(flagView)
    }
}
