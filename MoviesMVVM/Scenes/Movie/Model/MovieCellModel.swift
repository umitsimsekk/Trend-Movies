//
//  MovieCellModel.swift
//  tryMovies
//
//  Created by Ümit Şimşek on 27.03.2023.
//

import Foundation

struct MovieCellModel{
    var id : Int
    var title : String
    var date : String
    var rating : String
    var imageURL : URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.imageURL = makeImageUrl(movie.posterPath)
    }
    func makeImageUrl(_ imageCode : String) -> URL? {
        URL(string: "\(Constant.shared.imageServerAddress)\(imageCode)")
    }
}
