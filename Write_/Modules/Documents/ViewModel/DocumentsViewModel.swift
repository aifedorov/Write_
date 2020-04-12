//
//  DocumentsViewModel.swift
//  Write_
//
//  Created by Александр Федоров on 09.02.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import RxCocoa
import RxDataSources
import RxSwift

typealias DocumentSection = AnimatableSectionModel<Int, DocumentItem>

final class DocumentsViewModel {
    // MARK: Private Properties
    
    private let disposeBag = DisposeBag()
    private let createItem = DocumentItem(identity: UUID(), type: .create)
    private let placeholderItems = [DocumentItem](repeating: DocumentItem.makePlaceholder(), count: 5)
    private let documentItems = [DocumentItem](repeating: DocumentItem.makeDocument(), count: 2)
    
    // MARK: Public Properties
    
    var items: Observable<[DocumentItem]>!
    
    // MARK: Lifecylce
    
    init() {
        items = Observable.create { [unowned self] observerOfDocumentItem -> Disposable in
            var items = [self.createItem]
            
            if self.documentItems.count < self.placeholderItems.count {
                items.append(contentsOf: self.documentItems)
                self.placeholderItems[0 ..< self.documentItems.count].forEach { items.append($0) }
            }
            
            observerOfDocumentItem.onNext(items)
            observerOfDocumentItem.onCompleted()
            return Disposables.create()
        }
        
        items
            .debug()
            .subscribe()
            .disposed(by: disposeBag)
    }
}

#if DEBUG
    extension DocumentItem {
        static func makePlaceholder() -> DocumentItem {
            DocumentItem(identity: UUID(),
                         type: .placeholder)
        }
        
        static func makeDocument() -> DocumentItem {
            let displayData = DocumentItem.DisplayData(title: "Song for the Old Ones",
                                                       createdOn: "02 April, 2019",
                                                       pageCount: "4 Pages")
            return DocumentItem(identity: UUID(),
                                type: .document(displayData))
        }
    }
#endif
