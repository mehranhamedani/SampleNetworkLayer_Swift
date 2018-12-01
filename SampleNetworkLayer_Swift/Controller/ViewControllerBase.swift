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
    @IBOutlet weak var searchCountryCodeTextField: UITextField!
    @IBOutlet weak var addCountryView: UIView!
    @IBOutlet weak var countryNameTextField: UITextField!
    @IBOutlet weak var countryCodeTextField: UITextField!
    @IBOutlet weak var countryPhoneCodeTextField: UITextField!
    
    let baseUrl = "http://[Enter Your Server Address]:[Enter Your Server Port]"
    var countries: [ModelBase.Country] = []
    var pageTitle: String{
        return ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.pageTitle
        self.tableViewCellRegister()
        self.getCountries()
    }
    
    private func tableViewCellRegister(){
        self.tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "Country")
    }
    
    @IBAction func searchButtonAction(_ sender: Any){
        self.getCountry(countryCode: self.searchCountryCodeTextField.text)
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        self.searchCountryCodeTextField.text = ""
        self.countries = []
        self.getCountries()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        self.countryNameTextField.text = ""
        self.countryCodeTextField.text = ""
        self.countryPhoneCodeTextField.text = ""
        self.addCountryView.isHidden = false
    }
    
    @IBAction func countryCreateButtonAction(_ sender: Any) {
        self.createCountry(
            name: self.countryNameTextField.text!,
            code: self.countryCodeTextField.text!,
            phoneCode: self.countryPhoneCodeTextField.text!)
    }
    
    @IBAction func countryCancelButtonAction(_ sender: Any) {
        self.addCountryView.isHidden = true
    }
    
    func getCountries() {
        
    }
    
    func getCountry(countryCode: String?) {
        
    }
    
    func createCountry(name: String, code: String, phoneCode: String) {
        
    }
    
}

extension ViewControllerBase: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = self.countries[indexPath.row]
        let countryTableViewcell = tableView.dequeueReusableCell(withIdentifier: "Country") as! CountryTableViewCell
        countryTableViewcell.fill(name: country.Name, code: country.Code, phoneCode: country.PhoneCode)
        return countryTableViewcell
    }
    
}

