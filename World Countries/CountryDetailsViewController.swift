//
//  CountryDetailsViewController.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 06/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {

    var name: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = name
    }

}
