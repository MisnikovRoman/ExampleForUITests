//
//  ToDoListViewController.swift
//  Example
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import UIKit
import EasyUIKit

class SimpleViewModel {
    let title: String
    let isCompleted = false

    init(title: String) {
        self.title = title
    }
}

class ToDoListViewController: UIViewController {

    private let loadingView = LoadingView()
    private let table = TableView(
        cellType: UITableViewCell.self,
        viewModels: (0...100).map { SimpleViewModel(title: "Todo \($0)") },
        configurationAction: { cell, vm in cell.textLabel?.text = vm.title }
    )

    override func loadView() {
        self.view = loadingView
    }

    private func showTable() {
        self.view = table
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todos"
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showTable()
        }
    }
}

extension UIView {
    convenience init(closure: (UIView)->()) {
        self.init()
        closure(self)
    }
}

