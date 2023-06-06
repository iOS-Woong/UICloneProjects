//
//  FeedHeaderReusableView.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedHeaderReusableView: UICollectionReusableView {
    static let reuseIdentifier = "feedHeader"
    
    private lazy var userProfileImageView = {
       let imageView = UserProfileImageView()
        
        imageView.image = UIImage(named: "testImagewoongPhoto")
        
        return imageView
    }()
    
    private let userNameLabel = {
        let label = UILabel()
        
        label.text = "seo_hyeonung"
        label.font = UIFont.boldSystemFont(ofSize: 14.5)
        
        return label
    }()
    
    private let flagImageView = {
       let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "ellipsis")
        imageView.tintColor = .systemGray
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.size.width / 2
//        userProfileImageView.clipsToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let targetView = [userProfileImageView, userNameLabel, flagImageView]
        targetView.forEach(self.addSubview(_:))
        targetView.forEach { $0.translatesAutoresizingMaskIntoConstraints = false
        
        }
        
        NSLayoutConstraint.activate([
            userProfileImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.08),
            userProfileImageView.heightAnchor.constraint(equalTo: userProfileImageView.widthAnchor, multiplier: 1.0),
            userProfileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            userProfileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 10),
            userNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            flagImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.05),
            flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor, multiplier: 1.0),
            flagImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            flagImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
