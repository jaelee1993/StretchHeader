//
//  CollectionReusableView.swift
//  StretchyHeader
//
//  Created by Jae Lee on 1/23/19.
//  Copyright © 2019 Jae Lee. All rights reserved.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {

    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Hawaii"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 50)
        self.label.text = "Welcome to Hawaii"
        self.imageView.addSubview(self.label)
        addSubview(imageView)
        addSubview(self.label)
        label.fillSuperview()
        imageView.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        // Initialization code
    }
    
}
