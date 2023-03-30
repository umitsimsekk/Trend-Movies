//
//  Constant.swift
//  tryMovies
//
//  Created by Ümit Şimşek on 27.03.2023.
//

import Foundation

final class Constant {
    static var shared = Constant()
    private init(){}
    
    public var apiKey : String {
        get {
            return "669278251f2136ea7f3e883cabe99ea9"
        }
    }
    
    public var serverAdress : String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress : String{
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
    public var urlString : String {
        get {
            return serverAdress + "trending/all/day?api_key=" + apiKey
        }
    }
}
