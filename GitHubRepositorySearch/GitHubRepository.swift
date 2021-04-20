//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by yorifuji on 2021/04/17.
//

import Foundation

class GitHubRepository {

    var client: GitHubAPI?
    var response: SearchResponse?

    init(_ client: GitHubAPI) {
        self.client = client
    }

    func search(_ query: String, completion: @escaping () -> Void) {
        client?.search(query) { searchResponse in
            self.response = searchResponse
            completion()
        }
    }

    var count: Int {
        if let response = response {
            return response.repositories.count
        } else {
            return 0
        }
    }
}
