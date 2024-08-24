//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Farhana Mustafa on 8/23/24.
//

import Foundation

struct Follower: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case login, name, location, bio, following, followers
        case avatarUrl = "avatar_url"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case htmlUrl = "html_url"
        case createdAt = "created_at"
    }
}
