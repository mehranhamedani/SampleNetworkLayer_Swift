//
//  AlamofireRequest-Controller.swift
//  SampleNetworkLayer_Swift
//
//  Created by Mehran Hamedani Nezhad on 11/27/18.
//  Copyright © 2018 BehcomStudio. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AlamofireViewController: ViewControllerBase {
    
    override var pageTitle: String{
        return "Alamofire"
    }
    
    override func getCountries() {
        let url = URL(string: baseUrl + "/getCountries")
        Alamofire.request(url!, method: .get).responseJSON {
            (data) in
            
            switch data.result{
            case .success:
                if let jsonObjects = data.result.value as? [[String : Any]]{
                    var countries = [SimpleModel.Country]()
                    jsonObjects.forEach({
                        (jsonObject) in
                        
                        let name = jsonObject["name"] as? String
                        let code = jsonObject["code"] as? String
                        let phoneCode = jsonObject["phone_code"] as? String
                        let country = SimpleModel.Country(name: name, code: code, phoneCode: phoneCode)
                        countries.append(country)
                    })
                    self.countries = countries
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                break
            case .failure:
                print("error")
                break
            }
        }
    }
    
    override func getCountry(countryCode: String?) {
        let url = URL(string: baseUrl + "/getCountryByCode/" + (countryCode ?? ""))
        Alamofire.request(url!, method: .get).responseJSON {
            (data) in
            
            switch data.result{
            case .success:
                if let jsonObject = data.result.value as? [String : Any]{
                    let name = jsonObject["name"] as? String
                    let code = jsonObject["code"] as? String
                    let phoneCode = jsonObject["phone_code"] as? String
                    let country = SimpleModel.Country(name: name, code: code, phoneCode: phoneCode)
                    self.countries = []
                    self.countries.append(country)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                print("ok")
                break
            case .failure:
                print("error")
                break
            }
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
