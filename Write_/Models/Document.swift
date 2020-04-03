//
//  Document.swift
//  Write_
//
//  Created by Александр Федоров on 29.02.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

struct Document: Identifiable {
    let id: UUID
    let title: String
    let createdOn: Date
    let pageCount: Int
}
