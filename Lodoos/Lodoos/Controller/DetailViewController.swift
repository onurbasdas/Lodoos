//
//  DetailViewController.swift
//  Lodoos
//
//  Created by Onur Başdaş on 22.09.2022.
//

import UIKit
import Kingfisher
import Firebase

class DetailViewController: UIViewController {
    var detailMovieID : String = ""
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailRatingLabel: UILabel!
    @IBOutlet var detailPlotLabel: UILabel!
    @IBOutlet var detailActorsLabel: UILabel!
    @IBOutlet var detailWriterLabel: UILabel!
    @IBOutlet var detailGenreLabel: UILabel!
    @IBOutlet var detailCountryLabel: UILabel!
    @IBOutlet var detailReleasedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Analytics.logEvent("DetailControllerClicked", parameters: nil)
        
        self.showSpinner()
        WebService.searchMovie(movieID: detailMovieID) { [self] result in
            let url = URL(string: result?.poster ?? "")
            detailImageView.kf.setImage(with: url)
            detailTitleLabel.text = result?.title
            detailRatingLabel.text = "Rating: \(result?.imdbRating ?? "")"
            detailPlotLabel.text = result?.plot
            detailActorsLabel.text = "Actors: \(result?.actors ?? ""))"
            detailWriterLabel.text = "Writer: \(result?.writer ?? "")"
            detailGenreLabel.text = "Genre: \(result?.genre ?? "")"
            detailCountryLabel.text = "Country: \(result?.country ?? "")"
            detailReleasedLabel.text = "Released: \(result?.released ?? "")"
            self.removeSpinner()
        }
    }

}
