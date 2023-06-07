//
//  FriendCollectionViewCell.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/06.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    private let friendImageView = {
       let imageView = UserProfileImageView()
        
        imageView.image = UIImage(named: "testImagewoongPhoto")
        
        return imageView
    }()
    
    private let nameLabel = {
       let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 13.5)
        label.text = "seo_hyeonung"
        
        return label
    }()

    private let friendStateLabel = {
       let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 13.5)
        label.textColor = .systemGray2
        label.text = "프렌드상태 텍스트 컨피규어"
        
        return label
    }()

    private let closeButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.imageView?.tintColor = .systemGray3
        
        return button
    }()
    
    private let okButton = {
        let button = UIButton()
        
        button.setTitle("팔로우", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.5)
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViewsLayer()
    }
    
    private func setupViewsLayer() {
        let cgColor = UIColor.systemGray3.cgColor
        self.layer.borderColor = cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        
        okButton.layer.cornerRadius = 5
    }
    
    private func setupViews() {
        
        let targetView = [friendImageView, nameLabel, friendStateLabel, closeButton, okButton]
        targetView.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        targetView.forEach(self.addSubview(_:))
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            closeButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
            
            friendImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            friendImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            friendImageView.heightAnchor.constraint(equalTo: friendImageView.widthAnchor),
            friendImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: friendImageView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: friendImageView.bottomAnchor, constant: 15),
            nameLabel.widthAnchor.constraint(equalTo: friendImageView.widthAnchor, multiplier: 0.7),
            
            friendStateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            friendStateLabel.centerXAnchor.constraint(equalTo: friendImageView.centerXAnchor),
            friendStateLabel.widthAnchor.constraint(equalTo: friendImageView.widthAnchor, multiplier: 0.8),
            
            okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            okButton.centerXAnchor.constraint(equalTo: friendImageView.centerXAnchor),
            okButton.widthAnchor.constraint(equalTo: friendImageView.widthAnchor, multiplier: 1.2),
            okButton.heightAnchor.constraint(equalTo: okButton.widthAnchor, multiplier: 0.2)
        ])
        
    }
    
}
