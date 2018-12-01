//
//  AlamofireRequestWithObjectMapper-Controller.swift
//  SampleNetworkLayer_Swift
//
//  Created by Mehran Hamedani Nezhad on 11/27/18.
//  Copyright © 2018 BehcomStudio. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper

class AlamofireWithObjectMapperViewController: ViewControllerBase {
    
    override var pageTitle: String{
        return "Alamofire With Object Mapper"
    }
    
    override func getCountries() {
        let url = URL(string: baseUrl + "/getCountries")
        Alamofire.request(url!, method: .get).responseArray {
            (response: DataResponse<[ObjectMapperModel.Country]>) in
            
            if let countries = response.value{
                self.countries = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            print(response.error == nil ? "ok" : "error")
        }
    }
    
    override func getCountry(countryCode: String?) {
        let url = URL(string: baseUrl + "/getCountryByCode/" + (countryCode ?? ""))
        Alamofire.request(url!, method: .get).responseObject {
            (response: DataResponse<ObjectMapperModel.Country>) in
            
            if let country = response.value{
                self.countries = []
                self.countries.append(country)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            print(response.error == nil ? "ok" : "error")
        }
    }
    
    override func createCountry(name: String, code: String, phoneCode: String) {
        let url = URL(string: baseUrl + "/createCountry")
        let parameters: Parameters = [
            "name": name,
            "code": code,
            "phone_code": phoneCode
        ]
        Alamofire.request(url!, method: .post, parameters: parameters).responseJSON {
            (data) in
            
            DispatchQueue.main.async {
                self.addCountryView.isHidden = true
                self.getCountries()
            }
            print(data.error == nil ? "ok" : "error")
        }
    }
    
}
