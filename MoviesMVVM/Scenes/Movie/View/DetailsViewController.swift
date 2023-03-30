//
//  DetailsViewController.swift
//  tryMovies
//
//  Created by Ümit Şimşek on 27.03.2023.
//

import UIKit
import Kingfisher
class DetailsViewController: UIViewController {
    public var movie : DetailsModel? {
        didSet {
            detailsConfiguration()
        }
    }
    @IBOutlet weak var detailsDescriptionLabel: UILabel!
    @IBOutlet weak var detailsTitleLabel: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
extension DetailsViewController {
    func detailsConfiguration(){
        guard let movie else { return }
        self.detailsTitleLabel.text = movie.title
        self.detailsDescriptionLabel.text = movie.description
        self.detailsImageView.kf.setImage(with: movie.imageURL)
    }
}
