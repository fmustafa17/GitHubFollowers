//
//  GitHubFollowersListViewController.swift
//  GitHubFollowers
//
//  Created by Farhana Mustafa on 8/22/24.
//

import Combine
import SwiftUI
import UIKit

class GitHubFollowersListViewController: UIViewController {
    var username: String!
    
    private var networkManager = NetworkManager.shared
    
    lazy var followerGrid: UIHostingController<FollowerView> = {
        let swiftUIview = FollowerView()
        let hostingViewController = UIHostingController(rootView: swiftUIview)
        return hostingViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        do {
            try networkManager.getFollowers(for: username, page: 1)
        } catch {
            print("Failed to fetch followers: \(error.localizedDescription)")
        }
        
        view.addSubview(followerGrid.view)
        addChild(followerGrid)
        followerGrid.didMove(toParent: self)
        
        followerGrid.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followerGrid.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            followerGrid.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            followerGrid.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            followerGrid.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
