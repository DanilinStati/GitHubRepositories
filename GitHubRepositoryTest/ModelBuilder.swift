//
//  ModelBuilder.swift
//  GitHubRepositoryTest
//
//  Created by Даниил Статиев on 08.02.2021.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
   
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        
        return view
    }

}

