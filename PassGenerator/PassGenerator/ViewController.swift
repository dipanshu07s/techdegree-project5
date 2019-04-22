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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generatePass(_ sender: Any) {
    }
    
    
    @IBAction func populateData(_ sender: Any) {
    }
}

