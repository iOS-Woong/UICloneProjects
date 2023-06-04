//
//  FeedViewController.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedViewController: UIViewController {
    enum FeedSection: Int, CaseIterable {
        case story, feed, friendRecommand
        
        var columnsCount: Int {
            switch self {
            case .story:
                return 5
            case .feed:
                return 1
            case .friendRecommand:
                return 2
            }
        }
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<FeedSection, Contents>
    typealias SnapShot = NSDiffableDataSourceSnapshot<FeedSection, Contents>
    
    private let feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var dataSource: DataSource?
    private var snapShot: SnapShot?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewAttributes()
    }

    private func setupCollectionViewAttributes() {
        feedCollectionView.delegate = self
        feedCollectionView.register(FeedCollectionViewCell.self,
                                    forCellWithReuseIdentifier: FeedCollectionViewCell.reuseIdentfier)
        feedCollectionView.collectionViewLayout = createLayout()
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            guard let feedSection = FeedSection(rawValue: sectionIndex) else { return nil }
            let columnsCount = feedSection.columnsCount
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalWidth(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            
            var groupHeight: NSCollectionLayoutDimension
            switch feedSection {
            case .story:
                groupHeight = NSCollectionLayoutDimension.fractionalHeight(0.1)
            case .feed:
                groupHeight = NSCollectionLayoutDimension.fractionalHeight(0.4)
            case .friendRecommand:
                groupHeight = NSCollectionLayoutDimension.fractionalHeight(0.3)
            }
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columnsCount)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        return layout
    }
    
    private func setupViews() {
        view.addSubview(feedCollectionView)
        
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}

extension FeedViewController: UICollectionViewDelegate { }
