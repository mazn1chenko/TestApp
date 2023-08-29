//
//  NewsCollectionViewCell.swift
//  TestApp
//
//  Created by m223 on 29.08.2023.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "CellID"
    
    let imageOfPost = UIImageView()
    let titleOfPost = UILabel()
    let previewTextOfPost = UILabel()
    let counterOfLikesOnPost = UILabel()
    let timeShampOfPost = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Resourses.Colors.mainBackgroundColor
        
        setupViews()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        imageOfPost.translatesAutoresizingMaskIntoConstraints = false
        imageOfPost.image = UIImage(named: "TestingImage")
        
        titleOfPost.translatesAutoresizingMaskIntoConstraints = false
        titleOfPost.text = "TitleOfPost"
        titleOfPost.textColor = .white
        
        previewTextOfPost.translatesAutoresizingMaskIntoConstraints = false
        previewTextOfPost.text = "previewTextOfPost"
        previewTextOfPost.textColor = .white
        
        counterOfLikesOnPost.translatesAutoresizingMaskIntoConstraints = false
        counterOfLikesOnPost.text = "122 likes"
        counterOfLikesOnPost.textColor = .white
        
        timeShampOfPost.translatesAutoresizingMaskIntoConstraints = false
        timeShampOfPost.text = "4 hour ago"
        timeShampOfPost.textColor = .white
        
        
    }
    
    private func setupLayout() {
        addSubview(imageOfPost)
        addSubview(titleOfPost)
        addSubview(previewTextOfPost)
        addSubview(counterOfLikesOnPost)
        addSubview(timeShampOfPost)
        
        NSLayoutConstraint.activate([
        
            imageOfPost.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfPost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            imageOfPost.heightAnchor.constraint(equalToConstant: frame.height / 3),
            imageOfPost.widthAnchor.constraint(equalToConstant: frame.height / 3),
            
            titleOfPost.leadingAnchor.constraint(equalTo: imageOfPost.trailingAnchor, constant: 20),
            titleOfPost.topAnchor.constraint(equalTo: imageOfPost.topAnchor),
            
            previewTextOfPost.topAnchor.constraint(equalTo: titleOfPost.bottomAnchor, constant: 10),
            previewTextOfPost.leadingAnchor.constraint(equalTo: imageOfPost.trailingAnchor, constant: 20),
                        
            counterOfLikesOnPost.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            counterOfLikesOnPost.leadingAnchor.constraint(equalTo: imageOfPost.trailingAnchor, constant: 20),
            
            timeShampOfPost.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            timeShampOfPost.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
        
    }
    
    func configureCell() {
        
        print("LOL")
    }
    

    
}
