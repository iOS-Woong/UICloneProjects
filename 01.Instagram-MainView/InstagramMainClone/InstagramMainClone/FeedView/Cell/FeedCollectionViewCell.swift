//
//  FeedCollectionViewCell.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    static let reuseIdentfier = "feedCell"
    
    let feedImageView = {
       let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        feedImageView.image = nil
    }
    
//    func configureCell(data: Feed) {
//        feedImageView.image =
//    }
    
    
    private func setupViews() {
        contentView.addSubview(feedImageView)
        
        NSLayoutConstraint.activate([
            feedImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            feedImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            feedImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            feedImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
