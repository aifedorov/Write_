//
//  DocumentItem.swift
//  Write_
//
//  Created by Александр Федоров on 01.04.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import RxDataSources

struct DocumentItemDisplayData {
    let title: String
    let createdOn: String
    let pageCount: String
}

enum DocumentItemType {
    case create
    case placeholder
    case document(DocumentItemDisplayData)
}

struct DocumentItem: IdentifiableType {
    let identity: UUID
    let type: DocumentItemType
}

// MARK: - Equatable

extension DocumentItem: Equatable {
    static func == (lhs: DocumentItem, rhs: DocumentItem) -> Bool {
        lhs.identity == rhs.identity
    }
}
