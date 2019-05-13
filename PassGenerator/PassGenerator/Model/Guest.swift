//
//  Guest.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation



class Guest: Person {
    var seconds = 5
    
    override func swipe(_ pass: AmusementParkPass, on area: AreaAccess) -> Bool {
        if pass.areaAccess.contains(area) {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                guard self.seconds != 0 else {
                    timer.invalidate()
                    self.seconds = 5
                    return
                }
                self.seconds -= 1
            })
            
            if seconds == 5 {
                print("granted!!!")
                return true
            } else {
                print("wait!!!")
                return false
            }
            
        } else {
            print("Denied!!!")
            return false
        }
    }
}

class ClassicGuest: Guest {
    init() {
        super.init(firstName: nil, lastName: nil, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        passType = .classic
    }
}

class VIPGuest: Guest {
    init() {
        super.init(firstName: nil, lastName: nil, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        passType = .vip
    }
}

class ChildGuest: Guest {
    init(dateOfBirth: Date) {
        super.init(firstName: nil, lastName: nil, dateOfBirth: dateOfBirth, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        passType = .child
    }
}

class SeniorGuest: Guest {
    init(firstName: String, lastName: String, dateOfBirth: Date) {
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, ssn: nil, project: nil, company: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
        passType = .senior
    }
}

class SeasonGuest: Guest {
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(firstName: firstName, lastName: lastName, dateOfBirth: nil, ssn: nil, project: nil, company: nil, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        passType = .season
    }
}
