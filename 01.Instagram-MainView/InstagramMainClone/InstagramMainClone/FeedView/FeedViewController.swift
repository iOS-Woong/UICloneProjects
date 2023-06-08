//
//  FeedViewController.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<UUID, AnyHashable>
    typealias SnapShot = NSDiffableDataSourceSnapshot<UUID, AnyHashable>
    
    private var stories: [Story]
    private var feeds: [Feed]
    private var recommends: [Friend]
    
    private let feedCollectionView = UICollectionView(frame: .zero,
                                                      collectionViewLayout: UICollectionViewLayout())
    private var dataSource: DataSource?
    
    init(stories: [Story], feeds: [Feed], recommends: [Friend]) {
        self.stories = stories
        self.feeds = feeds
        self.recommends = recommends
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
        setupNavigation()
    }
    
    private func configureDataSource() {
        let storyCollectionCellRegistration = UICollectionView.CellRegistration<StoryCollectionViewCell, AnyHashable> { cell, indexPath, itemIdentifier in
            if indexPath == IndexPath(row: 1, section: 0) {
                // 첫번째셀 스토리 추가 string 설정
            }
            
//            cell.configure(data: itemIdentifier)
                
        }
        
        let feedCollectionCellRegistration = UICollectionView.CellRegistration<FeedCollectionViewCell, AnyHashable> { cell, indexPath, itemIdentifier in
            
//            cell.configureCell(data: itemIdentifier)
        }
        
        let freindRecommendCollectionCellResistration = UICollectionView.CellRegistration<FriendCollectionViewCell, AnyHashable> { cell, indexPath, itemIdentifier in
            
        }
                
        let feedHeaderViewResistration = UICollectionView.SupplementaryRegistration<FeedHeaderReusableView>(
            elementKind: UICollectionView.elementKindSectionHeader) { headerView ,elementKind, indexPath in
                headerView.backgroundColor = .white
            }
        
        let feedFooterViewResistration = UICollectionView.SupplementaryRegistration<FeedFooterReusableView>(
            elementKind: UICollectionView.elementKindSectionFooter) { footerView, elementKind, indexPath in
            }
        
        dataSource = .init(collectionView: feedCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let section = indexPath.section
            
            var cell = UICollectionViewCell()
            switch section {
            case 0:
                cell = collectionView.dequeueConfiguredReusableCell(using: storyCollectionCellRegistration, for: indexPath, item: itemIdentifier)
                break
            case 2:
                cell = collectionView.dequeueConfiguredReusableCell(using: freindRecommendCollectionCellResistration, for: indexPath, item: itemIdentifier)
            default:
                cell = collectionView.dequeueConfiguredReusableCell(using: feedCollectionCellRegistration, for: indexPath, item: itemIdentifier)
            }
            
            
            
            return cell
        })
        
        
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
        let firstSectionUUID = UUID()
        let secondSection = UUID()
        
        snapShot.appendSections([firstSectionUUID])
//        snapShot.appendItems(contents)

        dataSource?.apply(snapShot, animatingDifferences: false)
    }
    
    private func setupNavigation() {
        let heartBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"),
                                                 style: .plain,
                                                 target: self,
                                                 action: nil)
        let paperplaneBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"),
                                                      style: .plain,
                                                      target: self,
                                                      action: nil)
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItems = [heartBarButtonItem, paperplaneBarButtonItem]
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
                                                                                 heightDimension: .absolute(110)),
                                                               subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section?.orthogonalScrollingBehavior = .continuous
                
                return section
            case 2:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                    heightDimension: .fractionalHeight(0.8)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                                                 heightDimension: .absolute(430)),
                                                               subitems: [item])
                group.contentInsets = .init(top: 10, leading: 5, bottom: 10, trailing: 5)
                
                section = NSCollectionLayoutSection(group: group)
                section?.orthogonalScrollingBehavior = .groupPaging
                return section
            default :
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                    heightDimension: .fractionalHeight(1.0)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                                 heightDimension: .absolute(500)),
                                                               subitems: [item])
                group.contentInsets.top = 5
                group.contentInsets.bottom = 5
                section = NSCollectionLayoutSection(group: group)
                section?.orthogonalScrollingBehavior = .paging
                
                let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                              heightDimension: .absolute(35)),
                                                            elementKind: UICollectionView.elementKindSectionHeader,
                                                            alignment: .topLeading)
                let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                                               heightDimension: .fractionalHeight(0.25)),
                                                                             elementKind: UICollectionView.elementKindSectionFooter,
                                                                             alignment: .bottom)
                section?.boundarySupplementaryItems = [headerView, footerView]
                
                return section
            }
        }
        return layout
    }
    
    private func setupViews() {
        view.backgroundColor = .white
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
