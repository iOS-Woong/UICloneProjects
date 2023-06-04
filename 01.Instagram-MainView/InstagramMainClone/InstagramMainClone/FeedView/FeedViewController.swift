//
//  FeedViewController.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedViewController: UIViewController {

    private let feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewAttributes()
    }

    private func setupCollectionViewAttributes() {
        feedCollectionView.delegate = self
        feedCollectionView.register(FeedCollectionViewCell.self,
                                    forCellWithReuseIdentifier: FeedCollectionViewCell.reuseIdentfier)
        feedCollectionView.collectionViewLayout = createLayout()!
        
    }
    
    private func createLayout() -> UICollectionViewLayout? {
        
        return UICollectionViewLayout()
    }
    
    
}

extension FeedViewController: UICollectionViewDelegate { }
