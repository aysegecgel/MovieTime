//
//  MainViewCell.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 26.09.2024.
//

import UIKit
import SDWebImage

class MainViewCell: UITableViewCell {
    
    public static var identifier: String {
        get{
            return "MainViewCell"
        }}
    
    public static func register() -> UINib {
        UINib(nibName: "MainViewCell", bundle: nil)
    }

    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addBorder(color: .label, width: 1)
        backView.round()
        backView.backgroundColor = .lightGray
        movieImageView.round(5)
        
    }

    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rate
        self.movieImageView.sd_setImage(with: viewModel.imageURL)
    }
    
}
