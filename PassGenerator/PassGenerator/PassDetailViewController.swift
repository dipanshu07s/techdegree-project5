//
//  PassDetailViewController.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 25/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import UIKit

class PassDetailViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var rideBenefit: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    @IBOutlet weak var testResultLabel: UILabel!
    @IBOutlet weak var testResultBackground: UIView!
    
    
    @IBOutlet var accessTesting: [UIButton]!
    
    var pass: AmusementParkPass?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pass = pass, let passType = pass.entrant.passType {
            if let firstName = pass.entrant.firstName {
                firstNameLabel.isHidden = false
                firstNameLabel.text = firstName
            }
            
            let foodDiscount = pass.discounts[0]
            let merchDiscount = pass.discounts[1]
            switch foodDiscount {
            case .food(let percentage): foodDiscountLabel.text = "\(percentage)% discount on food"
            default: break
            }
            
            switch merchDiscount {
            case .merchandise(let percentage): merchDiscountLabel.text = "\(percentage)% discount on merchandise"
            default: break
            }
            
            switch passType {
            case .child: passTypeLabel.text = "Child guest pass"
            case .classic: passTypeLabel.text = "Classic guest pass"
            case .vip: passTypeLabel.text = "VIP guest pass"
            case .season: passTypeLabel.text = "Season guest pass"
            case .senior: passTypeLabel.text = "Senior guest pass"
            case .manager: passTypeLabel.text = "Manager pass"
            case .foodService: passTypeLabel.text = "Food Service employee pass"
            case .rideService: passTypeLabel.text = "Ride Service employee pass"
            case .maintenance: passTypeLabel.text = "Maintenance employee pass"
            case .contract(_): passTypeLabel.text = "Contract employee pass"
            case .vendor(_): passTypeLabel.text = "Vendor pass"
            }
        }
        
    }
    

    @IBAction func swipe(_ sender: UIButton) {
        guard let pass = pass else { return }
        switch sender {
        case accessTesting[0]: accessGranted(pass.entrant.swipe(pass, on: .amusement))
        case accessTesting[1]: accessGranted(pass.entrant.swipe(pass, on: .kitchen))
            case accessTesting[2]: accessGranted(pass.entrant.swipe(pass, on: .rideControl))
        case accessTesting[3]: accessGranted(pass.entrant.swipe(pass, on: .maintenance))
        case accessTesting[4]: accessGranted(pass.entrant.swipe(pass, on: .office))
        case accessTesting[5]: accessGranted(pass.entrant.swipe(pass, for: .allRides))
        case accessTesting[6]: accessGranted(pass.entrant.swipe(pass, on: .amusement))
        case accessTesting[7]: accessGranted(pass.entrant.swipe(pass, on: .amusement))
        default: break
        }
    }
    
    func accessGranted(_ granted: Bool) {
        if granted {
            testResultLabel.text = "Access Granted"
            testResultBackground.backgroundColor = .green
        } else {
            testResultLabel.text = "Access Denied"
            testResultBackground.backgroundColor = .red
        }
    }
    
    @IBAction func createNewPass(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}