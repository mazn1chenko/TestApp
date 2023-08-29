//
//  ViewController.swift
//  TestApp
//
//  Created by m223 on 29.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let newsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.cellID)
        
        return collectionView
        
    }()
    
    let titleLabel = UILabel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "News"
        view.backgroundColor = Resourses.Colors.mainBackgroundColor
        
        setupViews()
        setupLayouts()

    }
    
    private func setupViews() {
        
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        newsCollectionView.backgroundColor = Resourses.Colors.mainBackgroundColor
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "For You"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        
    }
    
    private func setupLayouts() {
        view.addSubview(titleLabel)
        view.addSubview(newsCollectionView)
        
        
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),

            newsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            newsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        
    }
    
    private func setupNavBar() {
        
        
        
    }


}

//MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
    
}

//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 5 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.cellID, for: indexPath) as! NewsCollectionViewCell
        cell.configureCell()
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 1.05, height: view.frame.height / 6.5)
    }
}

