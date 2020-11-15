//
//  NetworkManager.swift
//  CountriesOfTheWorldApp
//
//  Created by Yevhen Shevchenko on 14.11.2020.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getCountries(completion: @escaping ([Country]) -> ()) {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completion(countries)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    init() {}
}
