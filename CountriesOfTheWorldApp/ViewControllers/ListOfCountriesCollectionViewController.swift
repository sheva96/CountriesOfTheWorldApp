//
//  ListOfCountriesCollectionViewController.swift
//  CountriesOfTheWorldApp
//
//  Created by Yevhen Shevchenko on 14.11.2020.
//

import UIKit

class ListOfCountriesCollectionViewController: UICollectionViewController {
    
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getCountries { countries in
            self.countries = countries
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailInfoVC = segue.destination as! DetailInformationViewController
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        detailInfoVC.country = countries[indexPath.item]
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
       
        cell.layer.insertSublayer(gradient, at: 0)
        cell.countryNameLabel.text = countries[indexPath.item].name
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ListOfCountriesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 32, height: 100)
    }
}

