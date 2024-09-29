//
//  MainViewModel.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 30.08.2024.
//

import Foundation


class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
            APICaller.getTrendingMovies { [weak self] result in
                self?.isLoading.value = false
                switch result {
                case .success(let data):
                    print("Top Trending:\(data.results.count)")
                    self?.dataSource = data
                    self?.mapCellData()
                case .failure(let error):
                print(error)
                }
            
        }
        
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle( _ movie:Movie) -> String {
        return movie.name ?? movie.title ?? ""
    }
    
    func retriveMovie( with id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        
        return movie
    }
}
