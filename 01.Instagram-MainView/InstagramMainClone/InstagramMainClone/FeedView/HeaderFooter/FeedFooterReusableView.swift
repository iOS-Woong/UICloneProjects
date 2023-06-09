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
        imageView.tintColor = .black
        return imageView
    }()
    
    private let messageFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "message")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let directMessageFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "paperplane")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let pageControl = {
        let pageControl = UIPageControl(frame: .zero)
        
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = false
        pageControl.backgroundStyle = .minimal
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .systemGray3
        
        return pageControl
    }()
    
    private let loadFlagImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bookmark")
        imageView.tintColor = .black
        return imageView
    }()
    
    // MARK: 02. 댓글상단부
    let loveLabel = {
        let label = UILabel()
        
        label.text = "좋아요 38개"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    let descriptionUserNameLabel = {
        let label = UILabel()
        
        label.text = "seo_hyeonwoong"
        label.font = UIFont.boldSystemFont(ofSize: 13.5)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        return label
    }()
    
    let descriptionLabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 13.5)
        label.text = "test를 위한 텍스트컨피규어입니다est를 위한 텍스트컨피규어입니다est를 위한 텍스트컨피규어입니다est를 위한 텍스트컨피규어입니다"
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return label
    }()
    
    let commentCountLabel = {
        let label = UILabel()
        
        label.text = "댓글 2개 모두 보기"
        label.font = UIFont.boldSystemFont(ofSize: 13.5)
        label.textColor = .systemGray
        
        return label
    }()
    
    let commentUserNameLabel = {
        let label = UILabel()
        
        label.text = "seo_hyeonung"
        label.font = UIFont.boldSystemFont(ofSize: 13.5)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        return label
    }()
    
    let commentDescriptionLabel = {
        let label = UILabel()
        
        label.text = "커멘트의 내용입니다.커멘트의 내용입니다커멘트의 내용입니다커멘트의 내용입니다커멘트의 내용입니다"
        label.font = UIFont.systemFont(ofSize: 13.5)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return label
    }()
    // MARK: 03. 댓글하단부
    let commentUserProfileImageView = {
        let imageView = UserProfileImageView()
        
        imageView.image = UIImage(named: "testImagewoongPhoto")
        
        return imageView
    }()
    
    private let addCommentLabel = {
        let label = UILabel()
        
        label.text = "댓글을 입력해주세요"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13.5)
        
        return label
    }()
    
    //MARK: StackView
    
    private let bottomOfPictureStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let recommendButtonHorizontalStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let topOfCommentVerticalStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let bottomOfCommentHorizontalStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let descriptionHorizontalStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let commentHorizontalStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() { 
        [descriptionUserNameLabel, descriptionLabel].forEach(descriptionHorizontalStackView.addArrangedSubview(_:))
        [commentUserNameLabel, commentDescriptionLabel].forEach(commentHorizontalStackView.addArrangedSubview(_:))
        [loveFlagImageView, messageFlagImageView, directMessageFlagImageView].forEach(recommendButtonHorizontalStackView.addArrangedSubview(_:))
        
        let bottomOfPictureContents = [recommendButtonHorizontalStackView , pageControl, loadFlagImageView]
        let topOfCommentContents = [loveLabel, descriptionHorizontalStackView, commentCountLabel, commentHorizontalStackView]
        let bottomOfCommentContents = [commentUserProfileImageView, addCommentLabel]
        
        bottomOfPictureContents.forEach(bottomOfPictureStackView.addArrangedSubview(_:))
        topOfCommentContents.forEach(topOfCommentVerticalStackView.addArrangedSubview(_:))
        bottomOfCommentContents.forEach(bottomOfCommentHorizontalStackView.addArrangedSubview(_:))
        
        [bottomOfPictureStackView, topOfCommentVerticalStackView, bottomOfCommentHorizontalStackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        [bottomOfPictureStackView, topOfCommentVerticalStackView, bottomOfCommentHorizontalStackView].forEach(self.addSubview(_:))
        
        // 개별
        NSLayoutConstraint.activate([
            recommendButtonHorizontalStackView.leadingAnchor.constraint(equalTo: bottomOfPictureStackView.leadingAnchor, constant: 10),
            recommendButtonHorizontalStackView.trailingAnchor.constraint(equalTo: pageControl.leadingAnchor, constant: -20),
            recommendButtonHorizontalStackView.heightAnchor.constraint(equalTo: bottomOfPictureStackView.heightAnchor, multiplier: 0.6),

            loveFlagImageView.widthAnchor.constraint(equalTo: recommendButtonHorizontalStackView.heightAnchor),
            messageFlagImageView.widthAnchor.constraint(equalTo: recommendButtonHorizontalStackView.heightAnchor),
            directMessageFlagImageView.widthAnchor.constraint(equalTo: recommendButtonHorizontalStackView.heightAnchor),
            
            loadFlagImageView.widthAnchor.constraint(equalTo: recommendButtonHorizontalStackView.heightAnchor),
            loadFlagImageView.heightAnchor.constraint(equalTo: loadFlagImageView.widthAnchor, multiplier: 1.0),
            
            loadFlagImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            pageControl.centerXAnchor.constraint(equalTo: bottomOfPictureStackView.centerXAnchor),
            pageControl.widthAnchor.constraint(equalTo: bottomOfPictureStackView.widthAnchor, multiplier: 0.2),
            pageControl.heightAnchor.constraint(equalTo: bottomOfPictureStackView.heightAnchor, multiplier: 0.2),
            
            commentUserProfileImageView.widthAnchor.constraint(equalTo: bottomOfCommentHorizontalStackView.heightAnchor, multiplier: 1)
            
        ])
        
        // topOfComment Configure
        NSLayoutConstraint.activate([
            
        ])
        
        
        // StackView조절
        NSLayoutConstraint.activate([
            bottomOfPictureStackView.topAnchor.constraint(equalTo: self.topAnchor),
            bottomOfPictureStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomOfPictureStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomOfPictureStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            
            topOfCommentVerticalStackView.topAnchor.constraint(equalTo: bottomOfPictureStackView.bottomAnchor, constant: 5),
            topOfCommentVerticalStackView.leadingAnchor.constraint(equalTo: loveFlagImageView.leadingAnchor),
            topOfCommentVerticalStackView.trailingAnchor.constraint(equalTo: loadFlagImageView.trailingAnchor),
            topOfCommentVerticalStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            bottomOfCommentHorizontalStackView.topAnchor.constraint(equalTo: topOfCommentVerticalStackView.bottomAnchor, constant: 10),
            bottomOfCommentHorizontalStackView.leadingAnchor.constraint(equalTo: topOfCommentVerticalStackView.leadingAnchor),
            bottomOfCommentHorizontalStackView.trailingAnchor.constraint(equalTo: topOfCommentVerticalStackView.trailingAnchor),
            bottomOfCommentHorizontalStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
        ])
    }
    
}
