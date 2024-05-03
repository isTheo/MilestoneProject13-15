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
    var languages: Languages?
    var flag: String
    var population: Int
    var flags: Flags?
}



struct Name: Codable {
    var common: String
    var official: String
}

struct Flags: Codable {
    var png: String
    var svg: String
    var alt: String?
}

struct Languages: Codable {
    var ron: String?
}


