//
//  GitHubRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by yorifuji on 2021/04/17.
//

import Foundation

class GitHubRepositoryModel {

    var client: GitHubAPI

    init(_ client: GitHubAPI) {
        self.client = client
    }

    func searchRepository(_ query: String, completion: @escaping (SearchResponse?) -> Void) {
        client.search(query) { searchResponse in
            completion(searchResponse)
        }
    }
}
