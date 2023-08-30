//
//  SpecificNews.swift
//  TestApp
//
//  Created by m223 on 29.08.2023.
//

import UIKit

class SpecificNews: UIViewController {
    
    let mainImageView = UIView()
    let counterOfLikesLabel = UILabel()
    let titleOfPostLabel = UILabel()
    let previewOfPostLabel = UILabel()
    let timeShampOfPostLabel = UILabel()
    
    var selectedItem: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resourses.Colors.specificNewsBackgrounColor
        
        setupViews()
        setupLayouts()
    }
    
    
    private func setupViews() {
        
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.backgroundColor = .red
        if let backgroundImage = UIImage(named: "TestingImage.jpg") {
            let backgroundPattern = UIColor(patternImage: backgroundImage)
            mainImageView.backgroundColor = backgroundPattern
        }
        
        titleOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        //titleOfPostLabel.text = "If you see this - your network is bad :("
        titleOfPostLabel.font = .boldSystemFont(ofSize: 28)
        titleOfPostLabel.textColor = .white
        titleOfPostLabel.numberOfLines = 0
        
        previewOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        previewOfPostLabel.font = .systemFont(ofSize: 20)
        previewOfPostLabel.textColor = .lightGray
        previewOfPostLabel.numberOfLines = 0
        
        counterOfLikesLabel.translatesAutoresizingMaskIntoConstraints = false
//        counterOfLikesLabel.text = "000 likes"
        counterOfLikesLabel.font = .systemFont(ofSize: 14)
        counterOfLikesLabel.textColor = .white
        counterOfLikesLabel.numberOfLines = 1
        counterOfLikesLabel.layer.cornerRadius = 10
        counterOfLikesLabel.clipsToBounds = true
        counterOfLikesLabel.backgroundColor = .gray.withAlphaComponent(0.9)
        counterOfLikesLabel.textAlignment = .center
        
        
        timeShampOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
//        timeShampOfPostLabel.text = "000 hour ago"
        timeShampOfPostLabel.font = .systemFont(ofSize: 14)
        timeShampOfPostLabel.textColor = .white
        timeShampOfPostLabel.numberOfLines = 1
        timeShampOfPostLabel.layer.cornerRadius = 10
        timeShampOfPostLabel.clipsToBounds = true
        timeShampOfPostLabel.backgroundColor = .gray.withAlphaComponent(0.9)
        timeShampOfPostLabel.textAlignment = .center

        
        
        
    }
    
    private func setupLayouts() {
        view.addSubview(mainImageView)
        mainImageView.addSubview(titleOfPostLabel)
        mainImageView.addSubview(counterOfLikesLabel)
        mainImageView.addSubview(timeShampOfPostLabel)
        view.addSubview(previewOfPostLabel)
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor),
            mainImageView.widthAnchor.constraint(equalToConstant: view.frame.width),
            mainImageView.heightAnchor.constraint(equalToConstant: view.frame.height / 2.5),
            
            titleOfPostLabel.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -10),
            titleOfPostLabel.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 10),
            titleOfPostLabel.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: -10),
            
            counterOfLikesLabel.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 10),
            counterOfLikesLabel.bottomAnchor.constraint(equalTo: titleOfPostLabel.topAnchor, constant: -5),
            counterOfLikesLabel.heightAnchor.constraint(equalToConstant: 25),
            counterOfLikesLabel.widthAnchor.constraint(equalToConstant: 80),
            
            timeShampOfPostLabel.leadingAnchor.constraint(equalTo: counterOfLikesLabel.trailingAnchor, constant: 5),
            timeShampOfPostLabel.bottomAnchor.constraint(equalTo: titleOfPostLabel.topAnchor, constant: -5),
            timeShampOfPostLabel.heightAnchor.constraint(equalToConstant: 25),
            timeShampOfPostLabel.widthAnchor.constraint(equalToConstant: 80),

            previewOfPostLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10),
            previewOfPostLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            previewOfPostLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
}
