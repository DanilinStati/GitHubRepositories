//
//  NetworkService.swift
//  GitHubRepositoryTest
//
//  Created by Даниил Статиев on 08.02.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getRepository(complition: @escaping (Result<[Repository]?, Error>) -> Void )
}

class NetworkService: NetworkServiceProtocol {
    func getRepository(complition: @escaping (Result<[Repository]?, Error>) -> Void) {
        let urlString = "https://api.github.com/repositories?since=0"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let repositories = try JSONDecoder().decode([Repository].self, from: data)
                complition(.success(repositories))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
}
