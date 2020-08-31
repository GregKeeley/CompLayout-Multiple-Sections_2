//
//  LabelCell.swift
//  CompLayout-Multiple-Sections_2
//
//  Created by Gregory Keeley on 8/30/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class LabelCell: UICollectionViewCell {
    public lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    //Programmatic UI Setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    // Storyboard Setup
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    //helper initializer method
    private func commonInit() {
        textLabelConstraints()
    }
    private func textLabelConstraints() {
    addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}
