//
//  LoadingView.swift
//  Example
//
//  Created by Roman Misnikov on 06.06.2020.
//  Copyright © 2020 Роман Мисников. All rights reserved.
//

import UIKit
import TinyConstraints

class LoadingView: UIView {

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.tintColor = .systemRed
        indicator.startAnimating()
        return indicator
    }()
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Loading"
        lbl.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        lbl.textAlignment = .center
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {

        backgroundColor = .white

        let container = UIView()
        container.stack([ activityIndicator, label ], width: 250, spacing: 32)

        self.addSubview(container)
        container.centerInSuperview()
    }
}
