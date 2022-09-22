//
//  MainViewController.swift
//  Lodoos
//
//  Created by Onur Başdaş on 22.09.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
  
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var mainEmptyMovieBackView: UIView!
    @IBOutlet var mainTableView: UITableView!
    
    var movieObj : SearchResponse?
    var movieArray = [SearchResponse]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    func getData(title: String) {
        WebService.searchMovie(movieName: title) { [self] result in
            movieArray.append(result ?? SearchResponse())
          
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.loadData(data: movieArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieObj = movieArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            if let destination = segue.destination as? DetailViewController {
                destination.detailObj = movieObj
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getData(title: searchText)
        if searchText.isEmpty {
            mainEmptyMovieBackView.isHidden = false
        } else {
            mainEmptyMovieBackView.isHidden = true
        }
        movieArray = []
    }
    
}
