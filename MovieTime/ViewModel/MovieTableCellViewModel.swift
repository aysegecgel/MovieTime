//
//  MovieTableCellViewModel.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 26.09.2024.
//

import Foundation

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rate: String
    var imageURL: URL?
    
    init( movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.firstAirDate ?? movie.releaseDate ?? ""
        self.rate = "\(movie.voteAverage)/10"
        self.imageURL = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
        
        
    }
}
