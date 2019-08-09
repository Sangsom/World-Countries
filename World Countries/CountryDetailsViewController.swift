//
//  CountryDetailsViewController.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit
import MapKit
import Macaw

class CountryDetailsViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var capitalLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var subRegionLabel: UILabel!
    @IBOutlet var alphaCodeLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var mapView: MKMapView!
    
    // MARK: Variables
    var name: String!
    var capital: String!
    var region: String!
    var subRegion: String!
    var alphaCode: String!
    var population: Int!
    var flagURL: URL!
    var latlng: [Double]!
    var currency: String?
    var currencySymbol: String?
    var flagView: MacawView!

    override func viewDidLayoutSubviews() {
        flagView.frame.origin = CGPoint(x: 0, y: self.view.safeAreaInsets.top)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    // MARK: Helper methods

    func updateUI() {
        loadFlag()
        loadMap()
        title = name

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedPopulation = formatter.string(from: NSNumber(value: population))!
        var formattedCurrency = ""

        if let currencySymbol = currencySymbol {
            formattedCurrency = "\(currencySymbol.description) - "
        }
        if let currency = currency {
            formattedCurrency += "\(currency.description)"
        }

        capitalLabel.text = capital
        regionLabel.text = region
        subRegionLabel.text = subRegion
        alphaCodeLabel.text = alphaCode
        populationLabel.text = formattedPopulation
        currencyLabel.text = formattedCurrency
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
        flagView.layer.borderWidth = 1.0
        flagView.layer.borderColor = UIColor.gray.cgColor
        self.view.addSubview(flagView)
    }

    func loadMap() {
        let annotation = Capital(title: capital, coordinate: CLLocationCoordinate2D(latitude: latlng[0], longitude: latlng[1]))
        mapView.addAnnotation(annotation)
        mapView.setCenter(CLLocationCoordinate2D(latitude: latlng[0], longitude: latlng[1]), animated: true)
    }
}
