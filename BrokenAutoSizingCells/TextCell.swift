//
//  TextCell.swift
//  BrokenAutoSizingCells
//
//  Created by Foggin, Oliver (Developer) on 11/07/2017.
//  Copyright © 2017 Foggin, Oliver (Developer). All rights reserved.
//

import UIKit

public class TextCell: UICollectionViewCell {
    
    public let label = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
            ])
    }
    
    public override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        print(#function)
        return super.preferredLayoutAttributesFitting(layoutAttributes)
    }
    
    public override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        print(#function)
        super.apply(layoutAttributes)
    }
}


