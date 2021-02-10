//
//  CustomViewCell.swift
//  GitHubRepositoryTest
//
//  Created by Даниил Статиев on 08.02.2021.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    static var cellIdentifire = "identifire"
    
    var idRepository = UILabel()
    var nameRepository = UILabel()
    var ownerName = UILabel()
    var descriptionText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureNameRepository()
        configureIdRepository()
        configureOwnerName()
        configureDescription()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Settings UI elements

    fileprivate func configureIdRepository() {
        addSubview(idRepository)
        setupIdRepositoryConstraints()
        idRepository.font = UIFont.systemFont(ofSize: 16, weight: .ultraLight)
        idRepository.textAlignment = .right
    }
    
    fileprivate func configureNameRepository() {
        addSubview(nameRepository)
        setupNameRepositoryConstraits()
        nameRepository.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameRepository.numberOfLines = 0
    }
    
    fileprivate func configureOwnerName() {
        addSubview(ownerName)
        setupOwnerRepositoryConstraints()
        ownerName.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    fileprivate func configureDescription() {
        addSubview(descriptionText)
        setupDescriptionRepositoryConstraints()
        descriptionText.font = UIFont.systemFont(ofSize: 16)
        descriptionText.numberOfLines = 0
    }
    
// MARK: - Setup UI elements constrains
    
    var spasing: CGFloat = 12
    var labelDistance: CGFloat = 8
    
    fileprivate func setupNameRepositoryConstraits() {

        nameRepository.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameRepository.topAnchor.constraint(equalTo: topAnchor, constant: spasing),
            nameRepository.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spasing),
            nameRepository.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spasing)
        ])
    }
    
    fileprivate func setupIdRepositoryConstraints() {
        
        idRepository.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            idRepository.topAnchor.constraint(equalTo: nameRepository.bottomAnchor, constant: labelDistance),
            idRepository.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spasing)
        ])
    }
    
    fileprivate func setupOwnerRepositoryConstraints() {
        
        ownerName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ownerName.topAnchor.constraint(equalTo: nameRepository.bottomAnchor, constant: labelDistance),
            ownerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spasing)
        ])
        
    }
    
    fileprivate func setupDescriptionRepositoryConstraints() {
        
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: ownerName.bottomAnchor, constant: labelDistance),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spasing),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spasing),
            descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spasing)
        ])

    }
    
}

