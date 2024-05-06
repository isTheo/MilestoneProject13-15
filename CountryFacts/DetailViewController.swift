//
//  DetailViewController.swift
//  CountryFacts
//
//  Created by Matteo Orru on 05/05/24.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var country: Country!
    var currencies: Currencies!
    var flag: Flags?
    
    @IBOutlet var flagImage: UIImageView!
    var regionLabel: UILabel!
    var subregionLabel: UILabel!
    var populationLabel: UILabel!
    var languageLabel: UILabel!
    var currencyLabel: UILabel!
    
    
    override func loadView() {
        webView = WKWebView()
        view = webView
        
        setupLabels()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = country.name.common
        navigationItem.largeTitleDisplayMode = .never
    }
    
    
    func setupLabels() {
        regionLabel = UILabel()
        subregionLabel = UILabel()
        populationLabel = UILabel()
        languageLabel = UILabel()
        currencyLabel = UILabel()
        
        regionLabel.translatesAutoresizingMaskIntoConstraints = false
        regionLabel.textAlignment = .right
        regionLabel.text = "Region: \(country.region)"
        view.addSubview(regionLabel)
        
        subregionLabel.translatesAutoresizingMaskIntoConstraints = false
        subregionLabel.textAlignment = .right
        subregionLabel.text = "Subregion: \(country.subregion ?? "No value found.")"
        view.addSubview(subregionLabel)
        
        populationLabel.translatesAutoresizingMaskIntoConstraints = false
        populationLabel.textAlignment = .right
        populationLabel.text = "Population: \(country.population)"
        view.addSubview(populationLabel)
        
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        languageLabel.textAlignment = .right
        if let firstLanguageKey = country.languages?.keys.first,
           let firstLanguage = country.languages?[firstLanguageKey] {
            languageLabel.text = "Language: \(firstLanguage)"
        }
        view.addSubview(languageLabel)
        
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        //this isn't working
        currencyLabel.text = "Currency: \(country.currencies?.name ?? "No value")"
        view.addSubview(currencyLabel)
        
        
        NSLayoutConstraint.activate([
            regionLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 250),
            regionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0.3),
            subregionLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 270),
            subregionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0.3),
            populationLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 290),
            populationLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0.3),
            languageLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 310),
            languageLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0.3),
            currencyLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 330),
            currencyLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0.3),

            
        
        ])
    }
    

    
    
}
