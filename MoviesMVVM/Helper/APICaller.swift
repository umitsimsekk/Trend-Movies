//
//  APICaller.swift
//  tryMovies
//
//  Created by Ümit Şimşek on 27.03.2023.
//

import Foundation
enum DataError : Error {
    case invalidURL
    case invalidData
    case network(Error?)
}

final class APICaller {
    static let shared = APICaller()
    private init(){}
    
    func fetchMovie(compeletion: @escaping (Result<TrendingMovies,DataError>) -> Void ) {
        guard let url = URL(string: Constant.shared.urlString) else {
            print("wqe")
            compeletion(.failure(.invalidURL))
            
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                compeletion(.failure(.invalidData))
                return
            }
            do {
                guard  let result = try? JSONDecoder().decode(TrendingMovies.self, from: data) else {
                    return
                }
                compeletion(.success(result))
            }catch {
                compeletion(.failure(.network(error)))
            }
        }.resume()
    }
}
