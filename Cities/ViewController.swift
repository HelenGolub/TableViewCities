import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    let citiesArray = ["Kyiv", "Lviv", "Barcelona", "Rome", "Madrid", "Kharkiv", "Budapest", "Berdyansk", "Milan", "Prague",
                               "New York", "Poltava", "Venice", "Paris", "Vinnytsia"]
    
    var filteredCitiesArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredCitiesArray.append(contentsOf: citiesArray)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCitiesArray.removeAll()
        if searchText.characters.count == 0 {
            filteredCitiesArray.append(contentsOf: citiesArray)
        } else {
            for cities in citiesArray {
                if cities.range(of: searchText, options: String.CompareOptions.caseInsensitive) != nil {
                    filteredCitiesArray.append(cities)
                }
            }
        }
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCitiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell")!
        cell.textLabel?.text = filteredCitiesArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row%2 == 0) {
            cell.backgroundColor = .yellow
        } else {
            cell.backgroundColor = .white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let index = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! CityNameViewController
                destinationViewController.nameOfTheCity = filteredCitiesArray[index.row]
            }
        }
    }
}

