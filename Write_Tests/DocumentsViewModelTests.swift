//
//  DocumentsViewModelTests.swift
//  Write_Tests
//
//  Created by Александр Федоров on 12.04.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import RxBlocking
import RxSwift
import RxTest
import XCTest
@testable import Write

final class DocumentsViewModelTests: XCTestCase {
    private var scheduler: ConcurrentDispatchQueueScheduler!
    private var viewModel: DocumentsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = DocumentsViewModel()
        scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
    }
    
    override func tearDown() {
        viewModel = nil
        scheduler = nil
        super.tearDown()
    }
    
    func testCreateDocumentItem() {
        let observable = viewModel.items.asObservable().subscribeOn(scheduler)
        let result = try! observable.toBlocking().first()!
        XCTAssertEqual(DocumentItemType.create, result.first!.type)
    }
    
    func testPlaceholderItems() {
        let observable = viewModel.items.asObservable().subscribeOn(scheduler)
        let result = try! observable.toBlocking().first()!
        let placeholders = result.filter { $0.type == .placeholder }
        
        // Documents count - Placeholder count(max 5)
        XCTAssertEqual(placeholders.count, 3)
    }
    
    func testDocumentsItems() {
        let observable = viewModel.items.asObservable().subscribeOn(scheduler)
        let result = try! observable.toBlocking().first()!
        let documents = result.filter {
            if case .document = $0.type {
                return true
            } else {
                return false
            }
        }
        
        XCTAssertEqual(documents.count, 2)
    }
}

extension DocumentItemDisplayData: Equatable {
    public static func == (lhs: DocumentItemDisplayData, rhs: DocumentItemDisplayData) -> Bool {
        lhs.title == rhs.title &&
            rhs.pageCount == lhs.pageCount &&
            rhs.createdOn == lhs.createdOn
    }
}

extension DocumentItemType: Equatable {
    public static func == (lhs: DocumentItemType, rhs: DocumentItemType) -> Bool {
        switch lhs {
        case .create:
            guard case .create = rhs else { return false }
            return true
        case .placeholder:
            guard case .placeholder = rhs else { return false }
            return true
            
        case let .document(lhsDisplayData):
            guard case let .document(rhsDisplaData) = rhs else { return false }
            return lhsDisplayData == rhsDisplaData
        }
    }
}
