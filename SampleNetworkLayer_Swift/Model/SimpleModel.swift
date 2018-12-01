//
//  Country.swift
//  SampleNetworkLayer_Swift
//
//  Created by Mehran Hamedani Nezhad on 11/27/18.
//  Copyright © 2018 BehcomStudio. All rights reserved.
//

import Foundation
import UIKit

struct SimpleModel{
    
    class Country: ModelBase.Country {
        
        init(name: String?, code: String?, phoneCode: String?) {
            super.init()
            self.Name = name
            self.Code = code
            self.PhoneCode = phoneCode
        }
        
    }
    
}
