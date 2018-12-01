//
//  ViewControllerBase.swift
//  SampleNetworkLayer_Swift
//
//  Created by Mehran Hamedani Nezhad on 12/1/18.
//  Copyright © 2018 BehcomStudio. All rights reserved.
//

import UIKit

class ViewControllerBase: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var countryCodeTextField: UITextField!
    
    let baseUrl = "http://192.168.213.1:5000/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewCellRegister()
        self.getCountries()
    }
    
    private func tableViewCellRegister(){
        self.tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "Country")
    }
    
    @IBAction func searchButtonAction(_ sender: Any){
        
    }
    
    func getCountries(){
        
    }
    
    func getCountry(countryCode: String){
        
    }
    
    func createCountry(name: String, code: String, phoneCode: String){
        
    }

}
