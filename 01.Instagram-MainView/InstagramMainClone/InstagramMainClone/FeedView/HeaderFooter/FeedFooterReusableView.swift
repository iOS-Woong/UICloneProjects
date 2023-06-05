//
//  FeedFooterReusableView.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedFooterReusableView: UICollectionReusableView {
    static let reuseIdentifier = "feedFooter"
    
    private let loveFlagImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
    private let messageFlagImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
    private let directMessageFlagImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
    private let pageControl = {
       let pageControl = UIPageControl()
        
        return pageControl
    }()
    
    private let loadFlagImageView = {
       let imageView = UIImageView()
        
        return imageView
    }()
    
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
    
}
