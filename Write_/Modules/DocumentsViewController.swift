//
//  DocumentsViewController.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import RxCocoa
import RxDataSources
import UIKit

final class DocumentsViewController: ViewController, Storyboarded {
    // MARK: Outlets
    
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Public Properties
    
    var viewModel: DocumentsViewModel!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        navigationItem.titleView = LogoImageView(tintColor: .white)
        
        collectionView.register(DocumentPlaceholderCell.self)
        collectionView.collectionViewLayout = GridFlowLayout()
        collectionView.backgroundColor = .black
        
        bindCollectionView()
    }
    
    private func bindCollectionView() {
        viewModel.items
            .bind(to: collectionView.rx.items) { collectionView, row, _ in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = collectionView.dequeueReusableCell(DocumentPlaceholderCell.self, indexPath: indexPath)
                return cell
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UICollectionView

extension UICollectionView {
    func register(_ anyClass: AnyClass) {
        let reuseIdentifier = String(describing: anyClass.self)
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ anyClass: T.Type, indexPath: IndexPath) -> T {
        let reuseIdentifier = String(describing: anyClass.self)
        return dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! T
    }
}
