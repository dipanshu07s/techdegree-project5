//
//  Pass.swift
//  PassGenerator
//
//  Created by Dipanshu Sehrawat on 21/04/19.
//  Copyright © 2019 Dipanshu Sehrawat. All rights reserved.
//

import Foundation

struct AmusementParkPass {
    let entrant: Person
    let areaAccess: [AreaAccess]
    let rideAccess: [RideAccess]
    let discounts: [Discounts]
}

struct Pass {
    static func createChildGuestPassWith(dateOfBirth: Date?) throws -> AmusementParkPass {
        guard let dateOfBirth = dateOfBirth else { throw PassError.dateOfBirthMissing }
        
        let calander = Calendar.current
        let currentDate = Date()
        let birthYear = calander.component(.year, from: dateOfBirth)
        let currentYear = calander.component(.year, from: currentDate)
        if (currentYear - birthYear) > 5 {
            throw PassError.invalidDateOfBirth
        }
        
        let guest = ChildGuest(dateOfBirth: dateOfBirth)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createClassicGuestPassWith() throws -> AmusementParkPass {
        let guest = ClassicGuest()
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            print(guestAreaAccess)
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createVipGuestPassWith() throws -> AmusementParkPass {
        let guest = VIPGuest()
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createSeasonGuestPassWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = SeasonGuest(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createSeniorGuestPassWith(firstName: String?, lastName: String?, dateOfBirth: Date?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let dateOfBirth = dateOfBirth else { throw PassError.dateOfBirthMissing }
        
        let guest = SeniorGuest(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createFoodServiceEmployeeWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = FoodServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createRideServiceEmployeeWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = RideServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createMaintenanceEmployeeWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = MaintenanceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createContractEmployeeWith(firstName: String?, lastName: String?, project: Int?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        guard let project = project else { throw PassError.projectMissing }
        
        let guest = ContractEmployee(firstName: firstName, lastName: lastName, project: project, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createManagerWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = Manager(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
    
    static func createVendorWith(firstName: String?, lastName: String?, company: String?, dateOfBirth: Date?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let company = company else { throw PassError.companyMissing }
        guard let dateOfBirth = dateOfBirth else { throw PassError.dateOfBirthMissing }
        
        let guest = Vendor(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, company: company)
        if let guestAreaAccess = guest.passType?.areaAccess(), let guestRideAccess = guest.passType?.rideAccess(), let guestDiscount = guest.passType?.discounts() {
            return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
        }
        
        throw PassError.invalidPass
    }
}
