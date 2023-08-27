//
//  TitleTableViewCell.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 16/08/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
    
    weak var delegate: CollectionViewTableViewCellDelegate?
    
    private let titlePosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
        applyConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        titlePosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    private func applyConstraint() {
        let titlePosterUIImageViewConstraint = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
        
        let playButtonConstraint = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlePosterUIImageViewConstraint)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playButtonConstraint)
    }
}
