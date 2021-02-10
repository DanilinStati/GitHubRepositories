//
//  ViewController.swift
//  GitHubRepositoryTest
//
//  Created by Даниил Статиев on 08.02.2021.
//

import UIKit
import SafariServices

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    let refreshControl =  UIRefreshControl()
    var presenter: MainViewPresenterProtocol?
    var repositories: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repository"
        settingsTableView()
        settingsRefreshControll()
    }
    
// MARK: - Settings UI elements
    
    private func settingsTableView() {
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.register(CustomViewCell.self, forCellReuseIdentifier: CustomViewCell.cellIdentifire)
        tableView.frame = view.bounds
    }
    
    private func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func settingsRefreshControll() {
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Wait a second")
        tableView.refreshControl = refreshControl
    }
    
    @ objc private func refresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.repositories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomViewCell.cellIdentifire, for: indexPath) as! CustomViewCell
        let repositoryName = presenter?.repositories?[indexPath.row]
        cell.nameRepository.text = "Repository name: \(repositoryName?.name ?? "N/A")"
        cell.idRepository.text = "Id: \(repositoryName?.id ?? 0)"
        cell.ownerName.text = "Owner: \(repositoryName?.owner.login ?? "N/A")"
        cell.descriptionText.text = "Description: \(repositoryName?.description ?? "N/A")"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let repository = presenter?.repositories?[indexPath.row]
        guard let url = URL(string: repository?.html_url ?? "") else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }

}

// MARK: Working with the presenter

extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

