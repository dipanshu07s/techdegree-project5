//
//  ViewController.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 19/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import UIKit

enum DateError: Error {
    case dateOfBirthError
}

class ViewController: UIViewController {
    
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var project: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    @IBOutlet weak var mainCategory: UIStackView!
    @IBOutlet weak var subCategory: UIStackView!
    
    let passTypes: [String: [PassType]] = [
        "Guest": [.child, .classic, .season, .senior, .vip],
        "Employee": [.foodService, .rideService, .maintenance, .contract(project: 0)],
        "Manager": [.manager],
        "Vendor": [.vendor(company: "")]
    ]
    
    var selectedCategory: [PassType]?
    var selectedPass: PassType? {
        didSet {
            enableTextFieldFor(selectedPass)
        }
    }
    
    var firstNameField: String?
    var lastNameField: String?
    var dateOfBirthField: Date?
    var ssnField: Int?
    var projectField: Int?
    var companyField: String?
    var streetAddressField: String?
    var cityField: String?
    var stateField: String?
    var zipCodeField: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subCategory.isHidden = true
    }
    
    @IBAction func selectPassType(_ sender: UIButton) {
        let buttons = mainCategory.arrangedSubviews.map({ $0 as! UIButton })
        for button in buttons {
            if sender === button {
                let title = button.title(for: .normal)!
                if title == "Manager" {
                    selectedPass = .manager
                    subCategory.isHidden = true
                    print(selectedPass!)
                } else if title == "Vendor" {
                    selectedPass = .vendor(company: "")
                    subCategory.isHidden = true
                    print(selectedPass!)
                } else {
                    selectedCategory = passTypes[title]
                    setSubcategoryTitlesFor(selectedCategory)
                }
            }
        }
    }
    
    @IBAction func selectedSubCategory(_ sender: UIButton) {
        let buttons = subCategory.arrangedSubviews.map({ $0 as! UIButton })
        guard let category = selectedCategory else {
            // FIXME: - Add an alert
            return
        }
        for (index, button) in buttons.enumerated() {
            if sender === button {
                selectedPass = category[index]
            }
        }
    }
    
    
    @IBAction func generatePass(_ sender: Any) {
        guard let type = selectedPass else {
            // FIXME: - Throw an error
            return
        }
        
        var pass: AmusementParkPass
        
        do {
            try hasData()
            switch type {
            case .classic:
                pass = try Pass.createClassicGuestPassWith()
            case .vip:
                pass = try Pass.createVipGuestPassWith()
            case .child:
                pass = try Pass.createChildGuestPassWith(dateOfBirth: Date())
            case .foodService:
                pass = try Pass.createFoodServiceEmployeeWith(firstName: firstNameField, lastName: lastNameField, streetAddress: streetAddressField, city: cityField, state: streetAddressField, zipCode: zipCodeField)
            case .rideService:
                pass = try Pass.createFoodServiceEmployeeWith(firstName: firstNameField, lastName: lastNameField, streetAddress: streetAddressField, city: cityField, state: streetAddressField, zipCode: zipCodeField)
            case .maintenance:
                pass = try Pass.createFoodServiceEmployeeWith(firstName: firstNameField, lastName: lastNameField, streetAddress: streetAddressField, city: cityField, state: streetAddressField, zipCode: zipCodeField)
            case .manager:
                pass = try Pass.createFoodServiceEmployeeWith(firstName: firstNameField, lastName: lastNameField, streetAddress: streetAddressField, city: cityField, state: streetAddressField, zipCode: zipCodeField)
            case .season:
                pass = try Pass.createSeasonGuestPassWith(firstName: firstNameField, lastName: lastNameField, streetAddress: streetAddressField, city: cityField, state: streetAddressField, zipCode: zipCodeField)
            case .senior:
                pass = try Pass.createSeniorGuestPassWith(firstName: firstNameField, lastName: lastNameField, dateOfBirth: dateOfBirthField)
            case .vendor(_):
                pass = try Pass.createVendorWith(firstName: firstNameField, lastName: lastNameField, company: companyField, dateOfBirth: dateOfBirthField)
            case .contract(_):
                pass = try Pass.createContractEmployeeWith(firstName: firstNameField, lastName: lastNameField, project: projectField, streetAddress: streetAddressField, city: cityField, state: streetAddressField, zipCode: zipCodeField)
            }
            
            performSegue(withIdentifier: "PassDetail", sender: pass)
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PassDetail" {
            if let destination = segue.destination as? PassDetailViewController, let pass = sender as? AmusementParkPass {
                destination.pass = pass
            }
        }
    }
    
    
    @IBAction func populateData(_ sender: Any) {
        
    }
    
    func hasData() throws {
        if firstName.isEnabled {
            guard let name = firstName.text else {
                throw PassError.firstNameMissing
            }
            firstNameField = name
        }
        if lastName.isEnabled {
            guard let lastName = lastName.text else {
                throw PassError.lastNameMissing
            }
            lastNameField = lastName
        }
        if dateOfBirth.isEnabled {
            guard let dateOfBirth = dateOfBirth.text else {
                throw PassError.dateOfBirthMissing
            }
            // FIXME: - Date of birth
            dateOfBirthField = Date()
        }
        if streetAddress.isEnabled {
            guard let streetAddress = streetAddress.text else {
                throw PassError.streetAddressMissing
            }
            streetAddressField = streetAddress
        }
        if city.isEnabled {
            guard let city = city.text else {
                throw PassError.cityMissing
            }
            cityField = city
        }
        if state.isEnabled {
            guard let state = state.text else {
                throw PassError.stateMissing
            }
            stateField = state
        }
        if zipCode.isEnabled {
            guard let zipCode = zipCode.text, let zip = Int(zipCode) else {
                throw PassError.zipcodeMissing
            }
            zipCodeField = zip
        }
        if company.isEnabled {
            guard let company = company.text else {
                throw PassError.companyMissing
            }
            companyField = company
        }
    }
    
    func setSubcategoryTitlesFor(_ category: [PassType]?) {
        guard let category = category else {
            // FIXME: - Throw an error
            return
        }
        
        let buttons = subCategory.arrangedSubviews.map({ $0 as! UIButton })
        subCategory.isHidden = false
        
        for (index, button) in buttons.enumerated() {
            if index < category.count {
                let pass = category[index]
                button.isHidden = false
                
                switch pass {
                case .child: button.setTitle("Child", for: .normal)
                case .classic: button.setTitle("Classic", for: .normal)
                case .vip: button.setTitle("VIP", for: .normal)
                case .season: button.setTitle("Season", for: .normal)
                case .senior: button.setTitle("Senior", for: .normal)
                case .manager: continue
                case .foodService: button.setTitle("Food Service", for: .normal)
                case .rideService: button.setTitle("Ride Service", for: .normal)
                case .maintenance: button.setTitle("Maintenance", for: .normal)
                case .contract(_): button.setTitle("Contract", for: .normal)
                case .vendor(_): continue
                }
            } else {
                button.isHidden = true
            }
            
        }
    }
    
    func enableTextFieldFor(_ type: PassType?) {
        guard let type = type else {
            // FIXME: - Throw an error
            return
        }
        switch type {
        case .classic, .vip: enableTextFieldWith(firstNameField: false, lastNameField: false, dateOfBirthField: false, ssnField: false, projectField: false, complanyField: false, streetAddressField: false, cityField: false, stateField: false, zipField: false)
        case .child: enableTextFieldWith(firstNameField: false, lastNameField: false, dateOfBirthField: true, ssnField: false, projectField: false, complanyField: false, streetAddressField: false, cityField: false, stateField: false, zipField: false)
        case .season, .senior, .rideService, .foodService, .maintenance, .manager: enableTextFieldWith(firstNameField: true, lastNameField: true, dateOfBirthField: false, ssnField: false, projectField: false, complanyField: false, streetAddressField: true, cityField: true, stateField: true, zipField: true)
        case .contract(_): enableTextFieldWith(firstNameField: true, lastNameField: true, dateOfBirthField: false, ssnField: false, projectField: true, complanyField: false, streetAddressField: true, cityField: true, stateField: true, zipField: true)
        case .vendor(_): enableTextFieldWith(firstNameField: true, lastNameField: true, dateOfBirthField: true, ssnField: false, projectField: false, complanyField: true, streetAddressField: false, cityField: false, stateField: false, zipField: false)
        }
    }
    
    func enableTextFieldWith(firstNameField: Bool, lastNameField: Bool, dateOfBirthField: Bool, ssnField: Bool, projectField: Bool, complanyField: Bool, streetAddressField: Bool, cityField: Bool, stateField: Bool, zipField: Bool) {
        firstName.isEnabled = firstNameField
        lastName.isEnabled = lastNameField
        dateOfBirth.isEnabled = dateOfBirthField
        ssn.isEnabled = ssnField
        project.isEnabled = projectField
        company.isEnabled = complanyField
        streetAddress.isEnabled = streetAddressField
        city.isEnabled = cityField
        state.isEnabled = stateField
        zipCode.isEnabled = zipField
    }

}

