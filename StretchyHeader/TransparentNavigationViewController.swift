//
//  TransparentNavigationViewController.swift
//  StretchyHeader
//
//  Created by Jae Lee on 2/5/19.
//  Copyright © 2019 Jae Lee. All rights reserved.
//

import UIKit

class TransparentNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNav()
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupNav() {
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
