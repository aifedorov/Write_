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

final class DocumentsViewModel: ViewModel {
    let items = Observable.of([DocumentItem](repeating: DocumentItem.makePlaceholder(), count: 15))
}

#if DEBUG
    extension DocumentItem {
        static func makePlaceholder() -> DocumentItem {
            DocumentItem(identity: UUID(),
                         type: .placeholder)
        }
    }
#endif
