//
//  StoryCollectionViewCell.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/06.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    private let userImageView = {
       let imageView = UserProfileImageView()
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let userNameLabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11.5)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBorder()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Story) {
        userImageView.image = data.user.profileImage
        userNameLabel.text = data.user.name
    }
    
    private func setupBorder() {
        userImageView.layer.borderWidth = 2.0
        userImageView.layer.borderColor = CGColor.init(red: 201/255, green: 124/255, blue: 95/255, alpha: 1.0)
    }
    
    private func setupViews() {
        let targetView = [userImageView, userNameLabel]
        targetView.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        targetView.forEach(contentView.addSubview(_:))
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            userImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor, multiplier: 1.0),
            userImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 3),
            userNameLabel.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            userNameLabel.widthAnchor.constraint(equalTo: userImageView.widthAnchor)
        ])
    }
    
    
}
