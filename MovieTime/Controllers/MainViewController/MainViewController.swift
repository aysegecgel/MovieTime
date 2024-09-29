//
//  MainViewController.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 28.08.2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityLoading: UIActivityIndicatorView!
    var viewModel: MainViewModel = MainViewModel()
    
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bind()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }


    func configView() {
        self.title = "Movie Time"
        self.view.backgroundColor = .systemBackground
        setUpTableView()
    }
    
    func bind() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityLoading.startAnimating()
                } else {
                    self.activityLoading.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self , let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadData()
            
        }
    }
    
    func openDetailes(movieId: Int) {
        
        guard let movie = viewModel.retriveMovie(with: movieId) else {
            
            return 
        }
        
        let detailesViewModel = DetailesMovieViewModel(movie: movie)
        let detailesController = DetailesMovieViewController(viewModel: detailesViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailesController, animated: true)
        }
        
        
    }
    
}
