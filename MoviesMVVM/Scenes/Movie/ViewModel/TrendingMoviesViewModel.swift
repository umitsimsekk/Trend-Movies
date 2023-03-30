//
//  TrendingMoviesModel.swift
//  tryMovies
//
//  Created by Ümit Şimşek on 27.03.2023.
//

import Foundation

final class TrendingMoviesViewModel {
    var trendingMovies : TrendingMovies?
    var eventHandler : ((_ event : Event) -> Void)?
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRows(in section: Int) -> Int {
        return trendingMovies?.results.count ?? 0
    }
    
    
    func fetchAllMovies() {
        self.eventHandler?(.loading)
        APICaller.shared.fetchMovie { result in
            self.eventHandler?(.stopLoading)
            switch result {
            case .success(let trendingMovie):
                print(trendingMovie.results.count)
                self.trendingMovies = trendingMovie
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
    
}
extension TrendingMoviesViewModel  {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
