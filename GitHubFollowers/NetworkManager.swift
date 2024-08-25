//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Farhana Mustafa on 8/24/24.
//

import Combine
import Foundation

enum APIError: Error {
    case invalidURL
    case serverError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    @Published var followers: [Follower] = []
    private var cancellables = Set<AnyCancellable>()

    private init() {}
    
    /// API request to get the user's followers
    /// - Parameters:
    ///   - username: User's entered username to look up
    ///   - page: for pagination
    func getFollowers(for username: String, page: Int) throws {
        let endpoint: String = Constants.baseURL.rawValue + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
             throw APIError.invalidURL
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Follower].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            },
                receiveValue: { [weak self] followers in
                    self?.followers = followers
                }
            )
            .store(in: &cancellables)
    }
}
