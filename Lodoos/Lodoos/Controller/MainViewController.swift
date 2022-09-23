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
    
    var movieStr : String?
    var movieArray = [SearchResponse]()
    var mainSearchArray = [MainSearchModelContent]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    func getData(title: String) {
        WebService.getMainSearchMovie(movieName: title) { [self] result in
            mainSearchArray = result ?? []
            if ((result?.isEmpty) != nil) {
                mainEmptyMovieBackView.isHidden = true
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
            } else {
                mainEmptyMovieBackView.isHidden = false
            }
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainSearchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.loadData(data: mainSearchArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieStr = mainSearchArray[indexPath.row].imdbID
        self.performSegue(withIdentifier: "toDetailSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            if let destination = segue.destination as? DetailViewController {
                destination.detailMovieID = movieStr ?? ""
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getData(title: searchText)
        mainSearchArray = []
    }
    
}
