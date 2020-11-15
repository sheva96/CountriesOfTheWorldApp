//
//  Extension + CAGradientLayer().swift
//  CountriesOfTheWorldApp
//
//  Created by Yevhen Shevchenko on 15.11.2020.
//

import UIKit

extension UIViewController {
    var gradient: CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [
          UIColor(red: 0.827, green: 0.965, blue: 1, alpha: 1).cgColor,
          UIColor(red: 1, green: 0.902, blue: 0.902, alpha: 1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.bounds = view.bounds.insetBy(
            dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height
        )
        gradient.position = view.center
        return gradient
    }
}
