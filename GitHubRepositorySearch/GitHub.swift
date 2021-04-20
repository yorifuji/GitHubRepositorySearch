//
//  GitHub.swift
//  iOSEngineerCodeCheck
//
//  Created by yorifuji on 2021/04/16.
//

import Foundation

struct Owner: Decodable {
    var id: Int
    var avatarUrl: String
}

struct Repository: Decodable {
    var id: Int
    var fullName: String
    var owner: Owner
    var stargazersCount: Int
    var language: String?
    var forksCount: Int
    var openIssuesCount: Int
    var htmlUrl: String
}

struct SearchResponse: Decodable {
    var repositories: [Repository]
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}
