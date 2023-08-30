//
//  NewsCollectionViewCell.swift
//  TestApp
//
//  Created by m223 on 29.08.2023.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: NewsCollectionViewCellDelegate?

    static let cellID = "CellID"
    
    let imageOfPostLabel = UIImageView()
    let titleOfPostLabel = UILabel()
    let previewTextOfPostLabel = UILabel()
    let counterOfLikesOnPostLabel = UILabel()
    let timeShampOfPostLabel = UILabel()
    
    let separator = UIView()
    
    let expandCollapseButton = UIButton(type: .system)
    
    var isExpanded = true
    
    var indexPath: IndexPath?
    
    weak var collectionView: UICollectionView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Resourses.Colors.mainBackgroundColor
        
        setupViews()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray
        
        imageOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        imageOfPostLabel.image = UIImage(named: "TestingImage")
        
        titleOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOfPostLabel.text = "TitleOfPost"
        titleOfPostLabel.textColor = .white
        titleOfPostLabel.font = .boldSystemFont(ofSize: 18)
        titleOfPostLabel.numberOfLines = 3
        
        previewTextOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        previewTextOfPostLabel.textColor = .white
        previewTextOfPostLabel.font = .systemFont(ofSize: 16)
        previewTextOfPostLabel.numberOfLines = 2
        
        counterOfLikesOnPostLabel.translatesAutoresizingMaskIntoConstraints = false
        counterOfLikesOnPostLabel.text = "122 лайка"
        counterOfLikesOnPostLabel.textColor = .white
        counterOfLikesOnPostLabel.font = .systemFont(ofSize: 12)
        
        timeShampOfPostLabel.translatesAutoresizingMaskIntoConstraints = false
        timeShampOfPostLabel.text = "4 години тому"
        timeShampOfPostLabel.textColor = .white
        timeShampOfPostLabel.font = .systemFont(ofSize: 12)
        
        expandCollapseButton.translatesAutoresizingMaskIntoConstraints = false
        expandCollapseButton.setTitle("Розгорнути", for: .normal)
        expandCollapseButton.isHidden = false
        expandCollapseButton.backgroundColor = .white
        expandCollapseButton.setTitleColor(.black, for: .normal)
        expandCollapseButton.layer.cornerRadius = 10
        expandCollapseButton.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
    }
    
    private func setupLayout() {
        addSubview(separator)
        addSubview(imageOfPostLabel)
        addSubview(titleOfPostLabel)
        addSubview(previewTextOfPostLabel)
        addSubview(counterOfLikesOnPostLabel)
        addSubview(timeShampOfPostLabel)
        addSubview(expandCollapseButton)
        
        NSLayoutConstraint.activate([
            
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.centerXAnchor.constraint(equalTo: centerXAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.widthAnchor.constraint(equalToConstant: frame.width - 40),
        
            imageOfPostLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageOfPostLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageOfPostLabel.heightAnchor.constraint(equalToConstant: frame.height / 3),
            imageOfPostLabel.widthAnchor.constraint(equalToConstant: frame.height / 3),
            
            titleOfPostLabel.leadingAnchor.constraint(equalTo: imageOfPostLabel.trailingAnchor, constant: 10),
            titleOfPostLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleOfPostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            previewTextOfPostLabel.topAnchor.constraint(equalTo: titleOfPostLabel.bottomAnchor, constant: 5),
            previewTextOfPostLabel.leadingAnchor.constraint(equalTo: imageOfPostLabel.trailingAnchor, constant: 10),
            previewTextOfPostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            counterOfLikesOnPostLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            counterOfLikesOnPostLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            timeShampOfPostLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            timeShampOfPostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            expandCollapseButton.topAnchor.constraint(equalTo: previewTextOfPostLabel.bottomAnchor, constant: 10),
            expandCollapseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            expandCollapseButton.heightAnchor.constraint(equalToConstant: 25),
            expandCollapseButton.widthAnchor.constraint(equalToConstant: 100)

        ])
        
    }
    
    @objc func tapOnButton() {
        
        if isExpanded {
            previewTextOfPostLabel.numberOfLines = 0
            expandCollapseButton.setTitle("Згорнути", for: .normal)
            isExpanded.toggle()
            delegate?.buttonTapped(at: indexPath!)

        }else{
            previewTextOfPostLabel.numberOfLines = 2
            expandCollapseButton.setTitle("Розгорнути", for: .normal)
            isExpanded.toggle()

        }
    }
    
    func configureCell(model: Post) {
        titleOfPostLabel.text = model.title
        previewTextOfPostLabel.text = model.previewText
        
        counterOfLikesOnPostLabel.text = "\(model.likesCount ?? 0) лайків"
        
        let timestamp = model.timeshamp
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)
        timeShampOfPostLabel.text = "\(formattedDate)"
        
        if previewTextOfPostLabel.isTruncated() {
            expandCollapseButton.isHidden = false
        }else {
            expandCollapseButton.isHidden = true
        }
        expandCollapseButton.tag = model.postID ?? 00
        //collectionView?.reloadData()
    }
}

extension UILabel {
    func isTruncated() -> Bool {
        guard let labelText = text else {
            return false
        }
        
        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 17)],
            context: nil).size
        
        return labelTextSize.height > bounds.size.height
    }
}


protocol NewsCollectionViewCellDelegate: AnyObject {
    func buttonTapped(at indexPath: IndexPath)
}



