//
//  FollowerView.swift
//  GitHubFollowers
//
//  Created by Farhana Mustafa on 8/25/24.
//

import SwiftUI

struct FollowerView: View {
    @ObservedObject var networkManager = NetworkManager.shared
    
    var body: some View {
        List {
            ForEach(networkManager.followers, id: \.id) { follower in
                AsyncImage(url: URL(string: follower.avatarURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 50, height: 50)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    case .failure:
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    return FollowerView()
}
