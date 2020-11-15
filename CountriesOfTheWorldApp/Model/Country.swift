//
//  Country.swift
//  CountriesOfTheWorldApp
//
//  Created by Yevhen Shevchenko on 14.11.2020.
//

struct Country: Decodable {
    let name: String?
    let alpha2Code: String?
    let capital: String?
    let region: String?
    let subregion: String?
    let population: Int?
    let area: Double?
}
