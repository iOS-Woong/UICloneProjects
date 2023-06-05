//
//  FeedHeaderReusableView.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedHeaderReusableView: UICollectionReusableView {
    static let reuseIdentifier = "feedHeader"
    
    private let userProfileImage = {
       let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "cloud")
        
        return imageView
    }()
    
    private let userNameLabel = {
        let label = UILabel()
        
        label.text = "seo_hyeonung"
        
        return label
    }()
    
    private let flagImageView = {
       let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "ellipsis")
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [userProfileImage, userNameLabel, flagImageView].forEach(self.addSubview(_:))
        
        NSLayoutConstraint.activate([
            userProfileImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            userProfileImage.heightAnchor.constraint(equalTo: userProfileImage.widthAnchor, multiplier: 1.0),
            userProfileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            userProfileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImage.trailingAnchor, constant: 5),
            userNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            flagImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor, multiplier: 1.0),
            flagImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
    }
}
