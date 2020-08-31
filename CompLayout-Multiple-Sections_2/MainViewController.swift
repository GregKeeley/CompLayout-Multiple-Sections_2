//
//  ViewController.swift
//  CompLayout-Multiple-Sections_2
//
//  Created by Gregory Keeley on 8/29/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Int>
    
    enum Section: Int, CaseIterable {
        case grid
        case single
        var columnCount: Int {
            switch self {
            case .grid:
                return 4
            case .single:
                return 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

