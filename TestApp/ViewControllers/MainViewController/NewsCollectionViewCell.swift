//
//  NewsCollectionViewCell.swift
//  TestApp
//
//  Created by m223 on 29.08.2023.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "CellID"
    
    let imageOfPostLabel = UIImageView()
    let titleOfPostLabel = UILabel()
    let previewTextOfPostLabel = UILabel()
    let counterOfLikesOnPostLabel = UILabel()
    let timeShampOfPostLabel = UILabel()
    
    let expandCollapseButton = UIButton(type: .system)
    
    var isExpanded = false
    
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
        
        imageOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        imageOfPostLabel.image = UIImage(named: "TestingImage")
        
        titleOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOfPostLabel.text = "TitleOfPost"
        titleOfPostLabel.textColor = .white
        titleOfPostLabel.font = .boldSystemFont(ofSize: 20)
        titleOfPostLabel.numberOfLines = 3
        
        previewTextOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        previewTextOfPostLabel.text = "previewTextOfPost"
        previewTextOfPostLabel.textColor = .white
        previewTextOfPostLabel.font = .systemFont(ofSize: 18)
        previewTextOfPostLabel.numberOfLines = 2
        
        counterOfLikesOnPostLabel.translatesAutoresizingMaskIntoConstraints = false
        counterOfLikesOnPostLabel.text = "122 likes"
        counterOfLikesOnPostLabel.textColor = .white
        counterOfLikesOnPostLabel.font = .systemFont(ofSize: 14)
        
        timeShampOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        timeShampOfPostLabel.text = "4 hour ago"
        timeShampOfPostLabel.textColor = .white
        timeShampOfPostLabel.font = .systemFont(ofSize: 14)
        
        expandCollapseButton.translatesAutoresizingMaskIntoConstraints = false
        expandCollapseButton.setTitle("Expand", for: .normal)
        expandCollapseButton.isHidden = true
        expandCollapseButton.backgroundColor = .white
        expandCollapseButton.setTitleColor(.black, for: .normal)
        expandCollapseButton.layer.cornerRadius = 10
        expandCollapseButton.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
    }
    
    private func setupLayout() {
        addSubview(imageOfPostLabel)
        addSubview(titleOfPostLabel)
        addSubview(previewTextOfPostLabel)
        addSubview(counterOfLikesOnPostLabel)
        addSubview(timeShampOfPostLabel)
        addSubview(expandCollapseButton)
        
        NSLayoutConstraint.activate([
        
            imageOfPostLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfPostLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageOfPostLabel.heightAnchor.constraint(equalToConstant: frame.height / 3),
            imageOfPostLabel.widthAnchor.constraint(equalToConstant: frame.height / 3),
            
            titleOfPostLabel.leadingAnchor.constraint(equalTo: imageOfPostLabel.trailingAnchor, constant: 20),
            titleOfPostLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleOfPostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            previewTextOfPostLabel.topAnchor.constraint(equalTo: titleOfPostLabel.bottomAnchor, constant: 5),
            previewTextOfPostLabel.leadingAnchor.constraint(equalTo: imageOfPostLabel.trailingAnchor, constant: 20),
            previewTextOfPostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                        
            counterOfLikesOnPostLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            counterOfLikesOnPostLabel.leadingAnchor.constraint(equalTo: imageOfPostLabel.trailingAnchor, constant: 20),
            
            timeShampOfPostLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            timeShampOfPostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            expandCollapseButton.topAnchor.constraint(equalTo: previewTextOfPostLabel.bottomAnchor),
            expandCollapseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)

        ])
        
    }
    
    @objc func tapOnButton() {
        
        print("Razvernis`")
        
    }
    
    func configureCell(model: Post) {
        titleOfPostLabel.text = model.title
        previewTextOfPostLabel.text = model.previewText
        
        let labelSize = previewTextOfPostLabel.sizeThatFits(CGSize(width: bounds.width - 20, height: CGFloat.greatestFiniteMagnitude))
        
        if labelSize.height > previewTextOfPostLabel.font.lineHeight * 2 {
            expandCollapseButton.isHidden = false
        } else {
            expandCollapseButton.isHidden = true
        }
        counterOfLikesOnPostLabel.text = "\(model.likesCount ?? 0) likes"
        
        let timestamp = model.timeshamp
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)
        timeShampOfPostLabel.text = "\(formattedDate)"
    }
}
