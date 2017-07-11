//
//  ViewController.swift
//  BrokenAutoSizingCells
//
//  Created by Foggin, Oliver (Developer) on 11/07/2017.
//  Copyright © 2017 Foggin, Oliver (Developer). All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    private let totalCells = 150
    lazy private var values: [String] = {
        return (0...255).map {
            _ in
            switch arc4random_uniform(3) {
            case 0: return "Short Label."
            case 1: return "Medium length label that will wrap on two lines of text."
            default: return "Really long label that should hopefully go over three lines in the table view so that it increases the height."
            }
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.collectionViewLayout = AutoSizingLayout()
        collectionView?.register(TextCell.self, forCellWithReuseIdentifier: "cell")
        
        // This invalidation has no effect
//        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // This invalidation has no effect
//        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // This invalidation "fixes" the layout but causes a jump in the UI
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalCells
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TextCell
        let hue = CGFloat(indexPath.item) / 255
        cell.backgroundColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
        cell.label.text = values[indexPath.item]
        print(#function)
        return cell
    }
}

