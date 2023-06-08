//
//  SceneDelegate.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let feedSample = FeedSample()
        let feedViewController = FeedViewController(stories: feedSample.stories,
                                                    feeds: feedSample.feeds,
                                                    recommends: feedSample.recommends)
        let navigationFeedVC = UINavigationController(rootViewController: feedViewController)
        let blankVC1 = UIViewController()
        let blankVC2 = UIViewController()
        let blankVC3 = UIViewController()
        let blankVC4 = UIViewController()
        let tabbarController = UITabBarController()
        
        setupTabbarIcon(viewControllers: [feedViewController, blankVC1, blankVC2, blankVC3, blankVC4])
        navigationFeedVC.navigationBar.backgroundColor = .white
        tabbarController.tabBar.backgroundColor = .white
        tabbarController.setViewControllers([navigationFeedVC, blankVC1, blankVC2, blankVC3, blankVC4], animated: false)
        window.rootViewController = tabbarController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func setupTabbarIcon(viewControllers: [UIViewController]) {
        viewControllers.enumerated().forEach { $1.tabBarItem = UITabBarItem(title: nil,
                                                                            image: TabbarItem(rawValue: $0)?.icon,
                                                                            selectedImage: nil) }
        UITabBar.appearance().tintColor = .black
    }
    
}

enum TabbarItem: Int {
    case home, search, add, video, profile
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")
        case .search:
            return UIImage(systemName: "magnifyingglass")
        case .add:
            return UIImage(systemName: "plus.app")
        case .video:
            return UIImage(systemName: "play.rectangle.on.rectangle")
        case .profile:
            return UIImage(systemName: "person.crop.circle")
        }
    }
}
