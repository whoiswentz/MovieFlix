//
//  ViewController.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 09/08/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let homevc = UINavigationController(rootViewController: HomeViewController())
        homevc.title = "home"
        homevc.tabBarItem.image = UIImage(systemName: "house")
        
        let upcomingvc = UINavigationController(rootViewController: UpcomingViewController())
        upcomingvc.title = "Coming Soon"
        upcomingvc.tabBarItem.image = UIImage(systemName: "play.circle")
        
        let searchvc = UINavigationController(rootViewController: SearchViewController())
        searchvc.title = "Top Search"
        searchvc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let donwloadvc = UINavigationController(rootViewController: DownloadsViewController())
        donwloadvc.title = "Downloads"
        donwloadvc.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        tabBar.tintColor = .label
        
        setViewControllers([homevc, upcomingvc, searchvc, donwloadvc], animated: true)
    }


}
