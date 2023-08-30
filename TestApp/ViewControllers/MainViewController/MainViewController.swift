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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.cellID)
        return collectionView
        
    }()
    
    let titleLabel = UILabel()
    
    var allPostsArray: [Post]?
    
    var allSortedPostsArray: [Post]?
    
    let sortingButton = UIButton(type: .system)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "News"
        view.backgroundColor = Resourses.Colors.mainBackgroundColor
        
        setupViews()
        setupLayouts()
        networking()

    }
    
    private func setupViews() {
        
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        newsCollectionView.backgroundColor = Resourses.Colors.mainBackgroundColor

        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "For You"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        
        sortingButton.translatesAutoresizingMaskIntoConstraints = false
        sortingButton.setImage(UIImage(named: "sortButton"), for: .normal)
        sortingButton.tintColor = .white
        sortingButton.addTarget(self, action: #selector(openAlertForSorting), for: .touchUpInside)

    }
    
    private func setupLayouts() {
        view.addSubview(titleLabel)
        view.addSubview(newsCollectionView)
        view.addSubview(sortingButton)
        
        
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),

            newsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            newsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            sortingButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            sortingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
    }
    
    private func networking() {
        
        ApiManager.shared.getAllPosts { allPosts in
                self.allPostsArray = allPosts.posts
            
            DispatchQueue.main.async {
                self.newsCollectionView.reloadData()

            }
        }
    }
    
    @objc func openAlertForSorting() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let action1 = UIAlertAction(title: "Сортування за датою", style: .default) { [self] action in
            allSortedPostsArray = allPostsArray?.sorted(by: { $0.timeshamp ?? 0 > $1.timeshamp ?? 0 })
            allPostsArray = allSortedPostsArray
            newsCollectionView.reloadData()


        }
        let action2 = UIAlertAction(title: "Сортування за рейтингом", style: .default) { [self] action in
            allSortedPostsArray = allPostsArray?.sorted(by: { $0.likesCount ?? 0 > $1.likesCount ?? 0 })
            allPostsArray = allSortedPostsArray
            newsCollectionView.reloadData()

        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)

        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }
}

//MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = SpecificNews()
        let selectedItem = allPostsArray?[indexPath.item]
        vc.titleOfPostLabel.text = selectedItem?.title ?? "NoInternet"
        vc.counterOfLikesLabel.text = "\(selectedItem?.likesCount ?? 0) likes"

        let timestamp = selectedItem?.timeshamp
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let formattedDate = dateFormatter.string(from: date)
        vc.timeShampOfPostLabel.text = "\(formattedDate)"
        
        vc.previewOfPostLabel.text = "\(selectedItem?.previewText ?? "NoInternet")"
        navigationController?.pushViewController(vc, animated: true)
        
}
    
}

//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return allPostsArray?.count ?? 0 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.cellID, for: indexPath) as? NewsCollectionViewCell
        cell?.configureCell(model: (allPostsArray?[indexPath.row])!)
        cell?.collectionView = collectionView
        cell?.indexPath = indexPath
        cell?.delegate = self
        cell?.tag = indexPath.row
        return cell!

    }
    
    static func createcompos() -> UICollectionViewCompositionalLayout {
        
        
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height / 4.5)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { 2 }
}

extension MainViewController: NewsCollectionViewCellDelegate {
    func buttonTapped(at indexPath: IndexPath) {
        print(indexPath)
    }
}


