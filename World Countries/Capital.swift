//
//  Capital.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 08/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D

    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
