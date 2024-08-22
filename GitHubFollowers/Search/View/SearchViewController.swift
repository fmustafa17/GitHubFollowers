//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Farhana Mustafa on 8/20/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    var logoImageView = UIImageView()
    var callToActionButton = GitHubFollowersButton(backgroundColor: .systemGreen, title: "Get Followers")
    var userNameTextField = GitHubFollowersTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        guard let logoImage = UIImage(named: "gh-logo") else {
            fatalError("gh-logo should be in the bundle")
        }
        logoImageView.image = logoImage
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}
