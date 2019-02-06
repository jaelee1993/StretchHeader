//
//  StretchyCollectionViewController.swift
//  StretchyHeader
//
//  Created by Jae Lee on 2/3/19.
//  Copyright © 2019 Jae Lee. All rights reserved.
//

import UIKit


class StretchyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate  let CELL = "cell"
    fileprivate  let HEADER = "header"
    fileprivate let padding:CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func collectionViewSetup() {
        //layout customization
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
        
        collectionView.backgroundColor = .yellow
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CELL)
        collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HEADER)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 2 * self.padding, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HEADER, for: indexPath) as! CollectionReusableView
            headerView.backgroundColor = .orange
            return headerView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: self.view.frame.width, height: 300)
        return size
    }

    

}
