import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UITextFieldDelegate {
    
    
    let citiesArray = ["Kyiv", "Lviv", "Barcelona", "Rome", "Madrid", "Kharkiv", "Budapest", "Berdyansk", "Milan", "Prague",
                               "New York", "Poltava", "Venice", "Paris", "Vinnytsia"]
    
    var filteredCitiesArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var newCity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredCitiesArray.append(contentsOf: citiesArray)
        
    }
    
    @IBAction func addCityButton(_ sender: UIButton) {
        filteredCitiesArray.append(newCity.text!)
        
        let indexPath = IndexPath(row: filteredCitiesArray.count - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        newCity.text! = ""
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCitiesArray.removeAll()
        if searchText.count == 0 {
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
        if (indexPath.row % 2 == 0) {
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

