//
//  MainTableViewCell.swift
//  Lodoos
//
//  Created by Onur Başdaş on 22.09.2022.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    func loadData(data: SearchResponse) {
//        let url = URL(string: data.poster ?? "")
//        posterImageView.kf.setImage(with: url)
//        titleLabel.text = data.title
//        genreLabel.text = data.genre
//        plotLabel.text = data.plot
//    }
    
    func loadData(data: MainSearchModelContent) {
        let url = URL(string: data.poster ?? "")
        posterImageView.kf.setImage(with: url)
        titleLabel.text = data.title
        genreLabel.text = data.year
    }
    
}
