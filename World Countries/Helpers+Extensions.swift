//
//  Helpers+Extensions.swift
//  World Countries
//
//  Created by Rinalds Domanovs on 07/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromURL(_ imageURL: URL) {
        print("Called")
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    self.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
}
