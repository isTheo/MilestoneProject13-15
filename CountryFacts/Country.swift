//
//  Country.swift
//  CountryFacts
//
//  Created by Matteo Orru on 01/05/24.
//

import Foundation

struct Country: Codable {
    struct Name: Codable {
        let common: String
        let official: String
        let nativeName: [String: CommonOfficial]?
        
        struct NativeName: Codable {
            let ron: NameTranslation
            
            struct NameTranslation: Codable {
                let official: String
                let common: String
            }
        }
    }
    
    struct CommonOfficial: Codable {
        var official: String
        var common: String
    }
    
    let name: Name
    let tld: [String]
    let cca2: String
    let ccn3: String
    let cca3: String
    let cioc: String
    let independent: Bool
    let status: String
    let unMember: Bool
    let currencies: [String: Currency]
    
    struct Currency: Codable {
        let name: String
        let symbol: String
    }
    
    let idd: IDD
    
    struct IDD: Codable {
        let root: String
        let suffixes: [String]
    }
    
    let capital: [String]
    let altSpellings: [String]
    let region: String
    let subregion: String
    let languages: [String: String]
    let translations: [String: Translation]
    
    struct Translation: Codable {
        let official: String
        let common: String
    }
    
    let latlng: [Double]
    let landlocked: Bool
    let borders: [String]
    let area: Int
    let demonyms: [String: Demonym]
    
    struct Demonym: Codable {
        let f: String
        let m: String
    }
    
    let flag: String
    let maps: Maps
    
    struct Maps: Codable {
        let googleMaps: String
        let openStreetMaps: String
    }
    
    let population: Int
    let gini: [String: Double]
    let fifa: String
    let car: Car
    
    struct Car: Codable {
        let signs: [String]
        let side: String
    }
    
    let timezones: [String]
    let continents: [String]
    let flags: Flags
    
    struct Flags: Codable {
        let png: String
        let svg: String
        let alt: String
    }
    
    let coatOfArms: CoatOfArms
    
    struct CoatOfArms: Codable {
        let png: String
        let svg: String
    }
    
    let startOfWeek: String
    let capitalInfo: CapitalInfo
    
    struct CapitalInfo: Codable {
        let latlng: [Double]
    }
    
    let postalCode: PostalCode
    
    struct PostalCode: Codable {
        let format: String
        let regex: String
    }
}
