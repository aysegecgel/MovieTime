//
//  APICaller.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 31.08.2024.
//

import Foundation

enum NetworkError: Error {
    
    case urlError
    case canNotParsData
}

public class APICaller {
    
    
    
    static func getTrendingMovies(complationHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void ) {
        
        let urlString = NetworkConstant.shared.serverAdress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        
        guard let url = URL(string: urlString)
        
        else {
            complationHandler(.failure(.urlError))
            return}
        
        URLSession.shared.dataTask(with: url) { dataResponse, URLResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                complationHandler(.success(resultData))
            }
            else {
                complationHandler(.failure(.canNotParsData))
            }
        }.resume()
        
    }
}
