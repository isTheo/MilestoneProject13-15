//
//  ViewController.swift
//  CountryFacts
//
//  Created by Matteo Orru on 01/05/24.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
    }
        
    /*
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonCountry = try? decoder.decode([Country].self, from: json) {
            countries = jsonCountry
                
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    */
    func parse(json: Data) {
        
        do {
            let countries = try JSONDecoder().decode([Country].self, from: json)
            // ???
        } catch {
            print("Decoding error: \(error)")
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func showError() {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
        
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Numero di righe: \(countries.count)")
        return countries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let country = countries[indexPath.row]
        content.text = country.name.official
        cell.contentConfiguration = content
        
        cell.backgroundColor = .black
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //code
    }
    
    
}
    
    

