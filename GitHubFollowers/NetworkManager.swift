//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Farhana Mustafa on 8/24/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    /// API request to get the user's followers
    /// - Parameters:
    ///   - username: User's entered username to look up
    ///   - page: for pagination
    ///   - completionHandler: Returns the follower list if it exists, or an error string so the UI can display this message
    func getFollowers(for username: String, page: Int, completionHandler: @escaping ([Follower]?, String?) -> Void) {
        let endpoint: String = Constants.baseURL.rawValue + username + "/followers" + "?per_page=100" + "&page=" + String(page)
        
        guard let url = URL(string: endpoint) else {
            completionHandler(nil, "Error: Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
        }
        
    }
}
