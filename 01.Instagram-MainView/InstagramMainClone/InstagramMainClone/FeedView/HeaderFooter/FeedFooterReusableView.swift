//
//  FeedFooterReusableView.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedFooterReusableView: UICollectionReusableView {
    static let reuseIdentifier = "feedFooter"
    
    // MARK: 01. 사진 하단부
    private let loveFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        return imageView
    }()
    
    private let messageFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "message")
        return imageView
    }()
    
    private let directMessageFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "paperplane")
        return imageView
    }()
    
    private let pageControl = {
        let pageControl = UIPageControl()
        
        return pageControl
    }()
    
    private let loadFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bookmark")
        return imageView
    }()
    
    // MARK: 02. 댓글상단부
    private let loveLabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let descriptionUserNameLabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let descriptionLabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let commentCountLabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let commentUserNameLabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let commentDescriptionLabel = {
        let label = UILabel()
        
        return label
    }()
    // MARK: 03. 댓글하단부
    private let commentUserProfileImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let addCommentLabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let bottomOfPictureStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private let topOfCommentVerticalStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let bottomOfCommentHorizontalStackView = {
        let stackView = UIStackView()
         
         stackView.axis = .horizontal
         
         return stackView
    }()
    
    private let descriptionHorizontalStackView = {
        let stackView = UIStackView()
         
         stackView.axis = .horizontal
         
         return stackView
    }()
    
    private let commentHorizontalStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private let allContentsVerticalStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() { // 0.08
        [descriptionUserNameLabel, descriptionLabel].forEach(descriptionHorizontalStackView.addArrangedSubview(_:))
        [commentUserNameLabel, commentDescriptionLabel].forEach(commentHorizontalStackView.addArrangedSubview(_:))
    
        let bottomOfPictureContents = [loveFlagImageView, messageFlagImageView, directMessageFlagImageView, pageControl, loadFlagImageView]
        let topOfCommentContents = [loveLabel, descriptionHorizontalStackView, commentCountLabel, commentHorizontalStackView]
        let bottomOfCommentContents = [commentUserProfileImageView, addCommentLabel]
        
        bottomOfPictureContents.forEach(bottomOfPictureStackView.addArrangedSubview(_:))
        topOfCommentContents.forEach(topOfCommentVerticalStackView.addArrangedSubview(_:))
        bottomOfCommentContents.forEach(bottomOfCommentHorizontalStackView.addArrangedSubview(_:))
        
        [bottomOfPictureStackView, topOfCommentVerticalStackView, bottomOfCommentHorizontalStackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        [bottomOfPictureStackView, topOfCommentVerticalStackView, bottomOfCommentHorizontalStackView].forEach { $0.backgroundColor = .blue }
        [bottomOfPictureStackView, topOfCommentVerticalStackView, bottomOfCommentHorizontalStackView].forEach(self.addSubview(_:))
        NSLayoutConstraint.activate([
            bottomOfPictureStackView.topAnchor.constraint(equalTo: self.topAnchor),
            bottomOfPictureStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
            bottomOfPictureStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            
            topOfCommentVerticalStackView.topAnchor.constraint(equalTo: bottomOfPictureStackView.topAnchor),
            topOfCommentVerticalStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
            topOfCommentVerticalStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            bottomOfCommentHorizontalStackView.topAnchor.constraint(equalTo: topOfCommentVerticalStackView.topAnchor),
            bottomOfCommentHorizontalStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
            bottomOfCommentHorizontalStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            bottomOfCommentHorizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
