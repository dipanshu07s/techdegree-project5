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
        let guestAreaAccess = guest.guestType.areaAccess()
        let guestRideAccess = guest.guestType.rideAccess()
        let guestDiscount = guest.guestType.discounts()
        
        return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
    }
    
    static func createClassicGuestPassWith() throws -> AmusementParkPass {
        let guest = ClassicGuest()
        let guestAreaAccess = guest.guestType.areaAccess()
        let guestRideAccess = guest.guestType.rideAccess()
        let guestDiscount = guest.guestType.discounts()
        return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
    }
    
    static func createVipGuestPassWith() throws -> AmusementParkPass {
        let guest = VIPGuest()
        let guestAreaAccess = guest.guestType.areaAccess()
        let guestRideAccess = guest.guestType.rideAccess()
        let guestDiscount = guest.guestType.discounts()
        return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
    }
    
    static func createFoodServiceEmployeeWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = FoodServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        let guestAreaAccess = guest.employeeType.areaAccess()
        let guestRideAccess = guest.employeeType.rideAccess()
        let guestDiscount = guest.employeeType.discounts()
        return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
    }
    
    static func createRideServiceEmployeeWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = RideServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        let guestAreaAccess = guest.employeeType.areaAccess()
        let guestRideAccess = guest.employeeType.rideAccess()
        let guestDiscount = guest.employeeType.discounts()
        return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
    }
    
    static func createMaintenanceEmployeeWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = MaintenanceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        let guestAreaAccess = guest.employeeType.areaAccess()
        let guestRideAccess = guest.employeeType.rideAccess()
        let guestDiscount = guest.employeeType.discounts()
        return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
    }
    
    static func createManagerWith(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?) throws -> AmusementParkPass {
        guard let firstName = firstName else { throw PassError.firstNameMissing }
        guard let lastName = lastName else { throw PassError.lastNameMissing }
        guard let streetAddress = streetAddress else { throw PassError.streetAddressMissing }
        guard let city = city else { throw PassError.cityMissing }
        guard let state = state else { throw PassError.stateMissing }
        guard let zipCode = zipCode else { throw PassError.zipcodeMissing }
        
        let guest = Manager(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        let guestAreaAccess = guest.managerType.areaAccess()
        let guestRideAccess = guest.managerType.rideAccess()
        let guestDiscount = guest.managerType.discounts()
        return AmusementParkPass(entrant: guest, areaAccess: guestAreaAccess, rideAccess: guestRideAccess, discounts: guestDiscount)
    }
}
