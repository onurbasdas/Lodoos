//
//  DetailViewController.swift
//  Lodoos
//
//  Created by Onur Başdaş on 22.09.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var detailObj : SearchResponse?
    
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
        let url = URL(string: detailObj?.poster ?? "")
        detailImageView.kf.setImage(with: url)
        detailTitleLabel.text = detailObj?.title
        detailRatingLabel.text = "Rating: \(detailObj?.imdbRating ?? "")"
        detailPlotLabel.text = detailObj?.plot
        detailActorsLabel.text = "Actors: \(detailObj?.actors ?? ""))"
        detailWriterLabel.text = "Writer: \(detailObj?.writer ?? "")"
        detailGenreLabel.text = "Genre: \(detailObj?.genre ?? "")"
        detailCountryLabel.text = "Country: \(detailObj?.country ?? "")"
        detailReleasedLabel.text = "Released: \(detailObj?.released ?? "")"
    }

}
