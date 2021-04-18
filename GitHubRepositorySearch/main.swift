//
//  main.swift
//  GitHubRepositorySearch
//
//  Created by yorifuji on 2021/04/18.
//

import Foundation

print("Hello, World!")

let dispatchGroup = DispatchGroup()
dispatchGroup.enter()

let repository = GitHubRepository(GitHubSearchRepositoryAPI())
repository.search("apple/swift") {
    if let response = repository.response {
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
