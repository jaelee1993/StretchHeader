//
//  ViewController.swift
//  StretchyHeader
//
//  Created by Jae Lee on 1/23/19.
//  Copyright © 2019 Jae Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    
    fileprivate let CELL = "cell"
    fileprivate let HEADER = "header"
    fileprivate let padding:CGFloat = 16
    fileprivate let headerSize:CGFloat = 600
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.view.backgroundColor = .white
        collectionViewSetup()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collectionView.collectionViewLayout.invalidateLayout()
        let contentOffsetY = collectionView.contentOffset.y
        print(contentOffsetY)
        
        if contentOffsetY >= headerSize {
            self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            self.title = "Hawaii"
        }
        if contentOffsetY < headerSize {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.title = ""
        }
    }
    
    fileprivate func collectionViewSetup() {
        //layout customization
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.collectionViewLayout = StretchyLayout()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
        
        self.collectionView.backgroundColor = .white
        self.collectionView.contentInsetAdjustmentBehavior = .never
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CELL)
//        self.collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HEADER)
        self.collectionView.register(UINib(nibName: "CollectionNibReusableView", bundle:  nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HEADER)
        
    }

}





extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath)
        cell.backgroundColor = .black
        cell
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 2 * self.padding, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HEADER, for: indexPath) as! CollectionNibReusableView
        
        headerView.backgroundColor = .orange
        
        
        return headerView


    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: self.view.frame.width, height: headerSize)
        return size
    }
    
    
}
