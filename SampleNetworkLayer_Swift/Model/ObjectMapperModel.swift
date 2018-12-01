//
//  ObjectMapperModel.swift
//  SampleNetworkLayer_Swift
//
//  Created by Mehran Hamedani Nezhad on 12/1/18.
//  Copyright © 2018 BehcomStudio. All rights reserved.
//

import Foundation
import ObjectMapper

struct ObjectMapperModel{
    
    class Country: ModelBase.Country, Mappable {
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            super.Name       <- map["name"]
            super.Code       <- map["code"]
            super.PhoneCode  <- map["phone_code"]
        }
        
    }
    
}
