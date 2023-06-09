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
    private var currentFeedCount = 1
    
    private let feedCollectionView = UICollectionView(frame: .zero,
                                                      collectionViewLayout: UICollectionViewLayout())
    private lazy var pagenationIndicator = {
        let indicator = UIActivityIndicatorView()
        
        indicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        indicator.center = self.view.center
        indicator.color = .purple
        indicator.hidesWhenStopped = true
        indicator.style = .large
        self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    private var dataSource: DataSource?
    private var snapshot: SnapShot?
    
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
            guard let item = itemIdentifier as? Story else { return }
            cell.configure(data: item)
            
        }
        
        let feedCollectionCellRegistration = UICollectionView.CellRegistration<FeedCollectionViewCell, AnyHashable> { cell, indexPath, itemIdentifier in
            guard let item = itemIdentifier as? UIImage else { return }
            cell.feedImageView.image = item
        }
        
        let friendRecommendCollectionCellResistration = UICollectionView.CellRegistration<FriendCollectionViewCell, AnyHashable> { cell, indexPath, itemIdentifier in
            guard let item = itemIdentifier as? Friend else { return }
            cell.configure(data: item)
        }
        
        let feedHeaderViewResistration = UICollectionView.SupplementaryRegistration<FeedHeaderReusableView>(
            elementKind: UICollectionView.elementKindSectionHeader) { [weak self] headerView ,elementKind, indexPath in
                var index: Int
                if indexPath.section == 1 {
                    index = 0
                } else {
                    index = indexPath.section - 2
                }
                if index > (self?.feeds.endIndex)! - 1 {
                    return
                }
                
                guard let feed = self?.feeds[index] else { return }
                let user = feed.user
                
                headerView.configure(data: user)
            }
        
        let feedFooterViewResistration = UICollectionView.SupplementaryRegistration<FeedFooterReusableView>(
            elementKind: UICollectionView.elementKindSectionFooter) { [weak self]  footerView, elementKind, indexPath in
                var index: Int
                if indexPath.section == 1 {
                    index = 0
                } else {
                    index = indexPath.section - 2
                }
                
                if index > (self?.feeds.endIndex)! - 1 {
                    return
                }
                
                guard let feed = self?.feeds[index] else { return }
                
                footerView.configure(data: feed)
            }
        
        dataSource = .init(collectionView: feedCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let section = indexPath.section
            
            var cell = UICollectionViewCell()
            switch section {
            case 0:
                cell = collectionView.dequeueConfiguredReusableCell(using: storyCollectionCellRegistration, for: indexPath, item: itemIdentifier)
            case 2:
                cell = collectionView.dequeueConfiguredReusableCell(using: friendRecommendCollectionCellResistration, for: indexPath, item: itemIdentifier)
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
        snapshot = .init()
        let firstSection = UUID()
        let secondSection = UUID()
        let friendSection = UUID()
        
        snapshot?.appendSections([firstSection, secondSection, friendSection])
        snapshot?.appendItems(stories, toSection: firstSection)
        snapshot?.appendItems(feeds[0].image.image, toSection: secondSection)
        snapshot?.appendItems(recommends, toSection: friendSection)
        dataSource?.apply(snapshot!, animatingDifferences: false)
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
            feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            pagenationIndicator.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            pagenationIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

extension FeedViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentsHeight = feedCollectionView.contentSize.height
        print("컬렉션뷰컨텐츠높이:::", contentsHeight)
        let pagenagtionPoint = contentsHeight * 0.3
        let scrollViewYOffset = scrollView.contentOffset.y
        print("y오프셋:::", scrollViewYOffset)
        if pagenagtionPoint < scrollViewYOffset {
            pagenationIndicator.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.pagenationIndicator.stopAnimating()
                self.fetchPagenation()
            }
        }
    }

    private func fetchPagenation() {
        guard currentFeedCount < 16 else {
            pagenationIndicator.stopAnimating()
            return
        }
        
        for index in currentFeedCount...currentFeedCount + 2 {
            let addSection = UUID()
            self.snapshot?.appendSections([addSection])
            self.snapshot?.appendItems(feeds[index].image.image, toSection: addSection)
        }
        dataSource?.apply(self.snapshot!, animatingDifferences: true)
        currentFeedCount += 3
    }
}
