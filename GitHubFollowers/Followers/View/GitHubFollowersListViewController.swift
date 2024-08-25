//
//  GitHubFollowersListViewController.swift
//  GitHubFollowers
//
//  Created by Farhana Mustafa on 8/22/24.
//

import UIKit

class GitHubFollowersListViewController: UIViewController {
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        do {
            try NetworkManager.shared.getFollowers(for: username, page: 0)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
