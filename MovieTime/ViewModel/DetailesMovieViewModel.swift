//
//  DetailesMovieViewModel.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 28.09.2024.
//

import Foundation


class DetailesMovieViewModel {
    
    var movie: Movie
    var movieId: Int
    var movieImage:URL?
    var movieTitle: String
    var movieDes: String
    
    init(movie: Movie) {
        self.movie = movie
        self.movieId = movie.id
        self.movieDes = movie.overview ?? ""
        self.movieTitle = movie.name ?? movie.title ?? ""
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {
        
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
