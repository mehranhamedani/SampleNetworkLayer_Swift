//
//  ViewController.swift
//  SampleNetworkLayer_Swift
//
//  Created by Mehran Hamedani Nezhad on 11/26/18.
//  Copyright © 2018 BehcomStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        var viewController: UIViewController!
        let viewName = "MainView"
        switch sender.tag {
            case 0:
                viewController = URLRequestViewController(nibName: viewName, bundle: nil)
                break
            case 1:
                viewController = AlamofireViewController(nibName: viewName, bundle: nil)
                break
            case 2:
                viewController = AlamofireWithObjectMapperViewController(nibName: viewName, bundle: nil)
                break
            default: break
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

