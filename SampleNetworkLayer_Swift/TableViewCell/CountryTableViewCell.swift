//
//  CountryTableViewCell.swift
//  SampleNetworkLayer_Swift
//
//  Created by Mehran Hamedani Nezhad on 12/1/18.
//  Copyright © 2018 BehcomStudio. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneCodeLabel: UILabel!
    @IBOutlet weak var nameAndCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fill(name: String?, code: String?, phoneCode: String?){
        let nameAndCode = (name ?? "") + "(" + (code ?? "") + ")"
        self.nameAndCodeLabel.text = nameAndCode
        self.phoneCodeLabel.text = phoneCode
    }
    
}
