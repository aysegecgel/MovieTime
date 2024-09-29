//
//  DetailesMovieViewController.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 28.09.2024.
//

import UIKit
import SDWebImage

class DetailesMovieViewController: UIViewController {
    
    
    @IBOutlet weak var detailesImageView: UIImageView!
    @IBOutlet weak var discreptionLabel: UILabel!
    @IBOutlet weak var detailesTitleLabel: UILabel!
    
    var viewModel: DetailesMovieViewModel
    
    init(viewModel: DetailesMovieViewModel){
        self.viewModel = viewModel
        super.init(nibName: "DetailesMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuView()
        
    }


    func configuView() {
        
        self.title = "Movie Details"
        detailesTitleLabel.text = viewModel.movieTitle
        discreptionLabel.text = viewModel.movieDes
        detailesImageView.sd_setImage(with: viewModel.movieImage)
    }

}
