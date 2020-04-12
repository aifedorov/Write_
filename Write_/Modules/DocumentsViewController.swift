//
//  DocumentsViewController.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift
import UIKit

final class DocumentsViewController: UIViewController, Storyboarded {
    // MARK: Outlets
    
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Public Properties
    
    var viewModel: DocumentsViewModel!
    
    // MARK: Private Properties
    
    private let disposeBag = DisposeBag()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        navigationItem.titleView = LogoImageView(tintColor: .white)
        
        collectionView.register([DocumentPlaceholderCell.self, DocumentCell.self, NewDocumentCell.self])
        collectionView.collectionViewLayout = GridFlowLayout()
        collectionView.backgroundColor = .black
        
        bindCollectionView()
    }
    
    private func bindCollectionView() {
        viewModel.items
            .bind(to: collectionView.rx.items) { (collectionView, row: Int, item: DocumentItem) in
                let indexPath = IndexPath(row: row, section: 0)
                switch item.type {
                case .create:
                    let cell = collectionView.dequeueReusableCell(NewDocumentCell.self, indexPath: indexPath)
                    return cell
                    
                case .placeholder:
                    let cell = collectionView.dequeueReusableCell(DocumentPlaceholderCell.self, indexPath: indexPath)
                    return cell
                    
                case let .document(displayData):
                    let cell = collectionView.dequeueReusableCell(DocumentCell.self, indexPath: indexPath)
                    cell.configure(displayData)
                    return cell
                }
            }
            .disposed(by: disposeBag)
    }
}
