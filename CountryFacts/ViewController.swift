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
        
        //Seems to work only with this link
        let urlString: String = "https://restcountries.com/v3.1/all"
        //I want to display all the countries names in the tableview but this https://restcountries.com/v3.1/all doesn't work
        
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
    
    
    func parse(json: Data) {
        do {
            let decoder = JSONDecoder()
            countries = try decoder.decode([Country].self, from: json)
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
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name.common
        
        cell.backgroundColor = .yellow
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //here I'll push the DetailViewController
    }
    
    
    
    
}
    
    

