import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    private let citiesArray = ["Kyiv", "Lviv", "Barcelona", "Rome", "Madrid", "Kharkiv", "Budapest", "Berdyansk", "Milan", "Prague",
                               "New York", "Poltava", "Venice", "Paris", "Vinnytsia"]
    var filteredCitiesArray = [String]()
    var searchActive = false

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCitiesArray = ta
        
        if filteredCitiesArray.count == 0 {
            searchActive = false;
        } else {
            searchActive = true;
        }
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filteredCitiesArray.count
        }
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell")!
        if searchActive {
            cell.textLabel?.text = filteredCitiesArray[indexPath.row]
        } else {
            cell.textLabel?.text = citiesArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row%2 == 0) {
            cell.backgroundColor = .yellow
        } else {
            cell.backgroundColor = .white
        }
    }
    
}

