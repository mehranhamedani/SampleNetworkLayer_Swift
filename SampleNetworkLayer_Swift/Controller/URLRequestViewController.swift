//
//  URLRequest-Controller.swift
//  SampleNetworkLayer_Swift
//
//  Created by Mehran Hamedani Nezhad on 11/27/18.
//  Copyright © 2018 BehcomStudio. All rights reserved.
//

import Foundation
import UIKit

class URLRequestViewController: ViewControllerBase {
    
    override var pageTitle: String{
        return "URLRequest"
    }
    
    override func getCountries() {
        let url = URL(string: baseUrl + "/getCountries")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            do{
                if let jsonData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [Any]{
                    if let jsonObjects = jsonData as? [[String : Any]]{
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
                }
                print("ok")
            }
            catch let error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    override func getCountry(countryCode: String?) {
        let url = URL(string: baseUrl + "/getCountryByCode/" + (countryCode ?? ""))
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            do{
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                if let jsonObject = jsonData as? [String : Any]{
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
            }
            catch let error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    override func createCountry(name: String, code: String, phoneCode: String) {
        let url = URL(string: baseUrl + "/createCountry")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        let dataDictionary: [String: Any] = [
            "name": name,
            "code": code,
            "phone_code": phoneCode
        ]
        let data = try! JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
        urlRequest.httpBody = data
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            
            DispatchQueue.main.async {
                self.addCountryView.isHidden = true
                self.getCountries()
            }
        }
        
        task.resume()
    }
    
}
