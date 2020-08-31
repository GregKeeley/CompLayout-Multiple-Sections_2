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
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionType = Section(rawValue: sectionIndex) else {
                return nil
            }
            let columns = sectionType.columnCount
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupHeight = columns == 1 ? NSCollectionLayoutDimension.absolute(200) : NSCollectionLayoutDimension.fractionalHeight(0.25)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        return layout
    }
}

