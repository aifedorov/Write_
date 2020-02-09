//
//  Assembly.swift
//  Write_
//
//  Created by Александр Федоров on 09.02.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

final class DocumentsAssembly {
    static func makeViewController() -> DocumentsViewController {
        let view = DocumentsViewController.instantiate()
        let viewModel = DocumentsViewModel()
        
        view.viewModel = viewModel
        
        return view
    }
}
