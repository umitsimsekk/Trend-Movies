//
//  DetailsModel.swift
//  tryMovies
//
//  Created by Ümit Şimşek on 27.03.2023.
//

import Foundation

class DetailsModel {
    var id : Int
    var title : String
    var description : String
    var imageURL : URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.description = movie.overview ?? ""
        self.imageURL = makeImageUrl(movie.posterPath)
    }
    func makeImageUrl(_ imageCode : String) -> URL? {
        URL(string: "\(Constant.shared.imageServerAddress)\(imageCode)")
    }
}
