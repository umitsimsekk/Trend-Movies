//
//  MovieCell.swift
//  tryMovies
//
//  Created by Ümit Şimşek on 27.03.2023.
//

import UIKit
import Kingfisher
class MovieCell: UITableViewCell {
    public var movie : MovieCellModel? {
        didSet {
            movieCellConfiguration()
        }
    }
    @IBOutlet weak var movieRateLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
extension MovieCell {
    func movieCellConfiguration(){
        guard let movie else { return }
        self.movieDateLabel.text = movie.date
        self.movieRateLabel.text = movie.rating
        self.movieTitleLabel.text = movie.title
        self.movieImageView.kf.setImage(with: movie.imageURL!)
    }
}
