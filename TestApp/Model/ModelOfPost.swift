//
//  ModelOfPost.swift
//  TestApp
//
//  Created by m223 on 29.08.2023.
//

import Foundation

// MARK: - AllPost
struct AllPost: Codable {
    let posts: [Post]?
}

// MARK: - Post
struct Post: Codable {
    let postID, timeshamp: Int?
    let title, previewText: String?
    let likesCount: Int?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
