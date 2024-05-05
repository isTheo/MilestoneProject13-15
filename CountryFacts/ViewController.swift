//
//  ViewController.swift
//  CountryFacts
//
//  Created by Matteo Orru on 01/05/24.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()
    var flags = [Flags]()
    var filterdCountries = [Country]()
    var savedCountries = [Country]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Country Facts"
        
        
        let urlString: String = "https://restcountries.com/v3.1/all"
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    self.parse(json: data)
                    return
                }
            }
            
            self.showError()
        }
        
        
        setupButtons()
    }
    
    
    
    func parse(json: Data) {
        do {
            let decoder = JSONDecoder()
            countries = try decoder.decode([Country].self, from: json)
            savedCountries = countries
            countries.sort { $0.name < $1.name }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error)
        }
    }
    
    
    func showError() {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Loading error", message: "Please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    
    func setupButtons() {
        let filterSymbol = UIImage(systemName: "magnifyingglass")
        let filterButton = UIBarButtonItem(image: filterSymbol, style: .plain, target: self, action: #selector(filterButtonTapped))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    
    @objc func filterButtonTapped() {
        let filterAlert = UIAlertController(title: "Find your Country", message: nil, preferredStyle: .alert)
        filterAlert.addTextField()
        let findAction = UIAlertAction(title: "Find", style: .default) { _ in
            guard let text = filterAlert.textFields?[0].text else { return }
            self.findCountry(text)
        }
        let backAction = UIAlertAction(title: "Reset", style: .destructive) { _ in
            self.resetButton()
        }
        
        filterAlert.addAction(findAction)
        filterAlert.addAction(backAction)
        present(filterAlert, animated: true)
        
    }
    
    
    func findCountry(_ text: String) {
        filterdCountries.removeAll()
        for country in savedCountries {
            if country.name.common.lowercased().contains(text.lowercased()) {
                filterdCountries.append(country)
            }
        }
        
        if filterdCountries.isEmpty { return }
        countries = filterdCountries
        tableView.reloadData()
    }
    
    
    func resetButton() {
        countries = savedCountries.sorted { $0.name.common.lowercased() < $1.name.common.lowercased() }
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = "\(country.flag) \(country.name.common)"
        


        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //here I'll push the DetailViewController
    }
    
    
    
    
}
    
    

