//
//  main.swift
//  GitHubRepositorySearch
//
//  Created by yorifuji on 2021/04/18.
//

import Foundation

let dispatchGroup = DispatchGroup()
dispatchGroup.enter()

let model = GitHubRepositoryModel(GitHubAPI())
model.searchRepository("apple/swift") { response in
    if let response = response {
        print("count: \(response.repositories.count)")
        response.repositories.forEach { repo in
            print("----")
            print("fullName: \(repo.fullName)")
            print("language: \(repo.language ?? "")")
            print("htmlUrl: \(repo.htmlUrl)")
        }
    }
    dispatchGroup.leave()
}

dispatchGroup.notify(queue: DispatchQueue.main) {
    exit(EXIT_SUCCESS)
}

dispatchMain()
