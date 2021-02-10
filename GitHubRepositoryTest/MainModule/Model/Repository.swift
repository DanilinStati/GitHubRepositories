//
//  Repository.swift
//  GitHubRepositoryTest
//
//  Created by Даниил Статиев on 08.02.2021.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let owner: Owner
    let description: String?
    let html_url: String
}

struct Owner: Decodable {
    let login: String
}
