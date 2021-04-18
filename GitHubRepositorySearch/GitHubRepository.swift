//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by yorifuji on 2021/04/17.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

class GitHubRepository {

    var apiClient: APIClient?

    var response: SearchResponse?
    var selectedIndex: Int = 0

    init(_ apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func search(_ query: String, completion: @escaping () -> Void) {
        apiClient?.search(query) { searchResponse in
            self.response = searchResponse
            completion()
        }
    }

    func cancel() {
        apiClient?.cancel()
    }

    func clear() {
        response = nil
    }

    var count: Int {
        if let response = response {
            return response.repositories.count
        } else {
            return 0
        }
    }

    func repositoryByIndex(_ index: Int) -> Repository? {
        if let response = response {
            return response.repositories[index]
        } else {
            return nil
        }
    }

    var selectedRepository: Repository? {
        repositoryByIndex(selectedIndex)
    }
}
