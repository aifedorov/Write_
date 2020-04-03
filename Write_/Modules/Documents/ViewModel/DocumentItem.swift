//
//  DocumentItem.swift
//  Write_
//
//  Created by Александр Федоров on 01.04.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import RxDataSources

struct DocumentItem: IdentifiableType {
    struct DisplayData {
        let title: String
        let createdOn: String
        let pageCount: String
    }
    
    enum `Type` {
        case create
        case placeholder
        case document(DisplayData)
    }
    
    let identity: UUID
    let type: Type
}

// MARK: - Equatable

extension DocumentItem: Equatable {
    static func == (lhs: DocumentItem, rhs: DocumentItem) -> Bool {
        lhs.identity == rhs.identity
    }
}
