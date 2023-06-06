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
    
    typealias DataSource = UICollectionViewDiffableDataSource<FeedSection, Int>
    typealias SnapShot = NSDiffableDataSourceSnapshot<FeedSection, Int>
    
    private var contents: [Contents]
    private let feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var dataSource: DataSource?
    
    init(contents: [Contents]) {
        self.contents = contents
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDataSource()
        setupCollectionViewAttributes()
        configureSnapShot()
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<FeedCollectionViewCell, Int> { cell, indexPath, itemIdentifier in
            print(indexPath)
            cell.configureCell(data: itemIdentifier)
        }
        
        let feedHeaderViewResistration = UICollectionView.SupplementaryRegistration<FeedHeaderReusableView>(
            elementKind: UICollectionView.elementKindSectionHeader) { headerView ,elementKind, indexPath in
                headerView.backgroundColor = .white
            }
        
        let feedFooterViewResistration = UICollectionView.SupplementaryRegistration<FeedFooterReusableView>(
            elementKind: UICollectionView.elementKindSectionFooter) { supplementaryView, elementKind, indexPath in
                
            }
        
        dataSource = .init(collectionView: feedCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        
        dataSource?.supplementaryViewProvider = { collectionView, text, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: feedHeaderViewResistration, for: indexPath)
        }
        
        dataSource?.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            var collectionReusableView: UICollectionReusableView?
            
            switch elementKind {
            case UICollectionView.elementKindSectionHeader:
                collectionReusableView = collectionView.dequeueConfiguredReusableSupplementary(using: feedHeaderViewResistration, for: indexPath)
            case UICollectionView.elementKindSectionFooter:
                collectionReusableView = collectionView.dequeueConfiguredReusableSupplementary(using: feedFooterViewResistration, for: indexPath)
            default :
                break
            }
            return collectionReusableView
        }
    }
    
    private func configureSnapShot() {
        var snapShot = SnapShot()
        snapShot.appendSections([.story, .feed, .friendRecommand])
        snapShot.appendItems(Array(21..<31), toSection: .story)
        snapShot.appendItems(Array(1..<11), toSection: .feed)
        snapShot.appendItems(Array(11..<21), toSection: .friendRecommand)
        dataSource?.apply(snapShot, animatingDifferences: false)
        
    }
    
    private func setupCollectionViewAttributes() {
        feedCollectionView.delegate = self
        feedCollectionView.collectionViewLayout = createLayout()
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            var section: NSCollectionLayoutSection?
            
            switch sectionIndex {
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.2),
                                                                    heightDimension: .fractionalHeight(1.0)))
                item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                                 heightDimension: .absolute(100)),
                                                               subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section?.orthogonalScrollingBehavior = .continuous
                
                return section
            case 1:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                    heightDimension: .fractionalWidth(1.0)))
                item.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                                 heightDimension: .absolute(500)),
                                                               subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section?.orthogonalScrollingBehavior = .paging
                section?.boundarySupplementaryItems = [
                    NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                                  heightDimension: .absolute(35)),
                                                                elementKind: UICollectionView.elementKindSectionHeader,
                                                                alignment: .topLeading),
                    NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                                  heightDimension: .absolute(35)),
                                                                elementKind: UICollectionView.elementKindSectionFooter,
                                                                alignment: .leading)
                ]
                
                return section
            case 2:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                    heightDimension: .fractionalHeight(1.0)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                                                 heightDimension: .absolute(300)),
                                                               subitems: [item])
                group.contentInsets = .init(top: 10, leading: 5, bottom: 10, trailing: 5)
                
                section = NSCollectionLayoutSection(group: group)
                section?.orthogonalScrollingBehavior = .groupPaging
                return section
            default :
                break
            }
            
            return section
        }
        return layout
    }
    
    private func setupViews() {
        feedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(feedCollectionView)
        
        NSLayoutConstraint.activate([
            feedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FeedViewController: UICollectionViewDelegate { }
