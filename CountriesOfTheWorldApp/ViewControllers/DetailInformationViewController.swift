//
//  DetailInformationViewController.swift
//  CountriesOfTheWorldApp
//
//  Created by Yevhen Shevchenko on 14.11.2020.
//

import UIKit

class DetailInformationViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.insertSublayer(gradient, at: 0)
        
        nameLabel.text = country.name
        descriptionLabel.text = """
                                Capital: \(country.capital ?? "information is not available")
                                Region: \(country.region ?? "information is not available")
                                Subregion: \(country.subregion ?? "information is not available")
                                Population: \(country.population ?? 0) people
                                Area: \(country.area ?? 0) km²
                                """
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        flagImageView.layer.cornerRadius = 10
        flagImageView.layer.masksToBounds = true
        
        
        DispatchQueue.global().async {
            guard let alpha2Code = self.country.alpha2Code?.lowercased() else { return }
            
            let url = "https://flagcdn.com/h240/\(alpha2Code).png"
            guard let imageUrl = URL(string: url) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                self.flagImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    @IBAction func closeButtonAction() {
        dismiss(animated: true)
    }
}
