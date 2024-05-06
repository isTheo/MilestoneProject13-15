//
//  Country.swift
//  CountryFacts
//
//  Created by Matteo Orru on 01/05/24.
//

import Foundation


struct Country: Codable {
    var name: Name
    var region: String
    var subregion: String?
    var languages: [String: String]?
    var flag: String
    var population: Int
    var flags: Flags?
    var currencies: Currencies?
    var capital: [String]?
}


//The < function compares two Name objects. It converts the names to lowercase and checks if the name on the left (lhs) comes before the name on the right (rhs) in alphabetical order.
struct Name: Codable, Comparable {
    static func < (lhs: Name, rhs: Name) -> Bool {
        return lhs.common.lowercased() < rhs.common.lowercased()
    }
    
    var common: String
    var official: String
}


struct Languages: Codable {
    var ron: String?
}


struct Currencies: Codable {
    var name: String?
    var symbol: String?
}


struct Flags: Codable {
    var png: String
    var svg: String
    var alt: String?
}




