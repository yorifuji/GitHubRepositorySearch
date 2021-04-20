//
//  GitHubAPI.swift
//  iOSEngineerCodeCheck
//
//  Created by yorifuji on 2021/04/18.
//

import Foundation

class GitHubAPI {
    let baseURL = "https://api.github.com/search/repositories?q="
    var task: URLSessionTask?

    func search(_ query: String, completion: @escaping (SearchResponse?) -> Void) {
        guard let url = URL(string: baseURL + query) else { return }
        task = URLSession.shared.dataTask(with: url) { (data, response, _) in
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let searchResponse = try? jsonDecoder.decode(SearchResponse.self, from: data)
            DispatchQueue.main.async {
                completion(searchResponse)
            }
        }
        task?.resume()
    }

    func cancel() {
        task?.cancel()
    }
}

